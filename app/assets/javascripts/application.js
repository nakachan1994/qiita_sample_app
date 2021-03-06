// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery3
//= require jquery.jscroll.min.js
//= require popper
//= require bootstrap-sprockets

//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .

// 以下１行を追加
$(document).on('turbolinks:load', function() {
  $(function () {
    $('.alert_btn').click(function(){
      alert('Hello World!')
    });
  });
// 閉じタグも忘れず追加
});

// 無限スクロール
$(window).on('scroll', function() {
    scrollHeight = $(document).height();
    scrollPosition = $(window).height() + $(window).scrollTop();
    if ( (scrollHeight - scrollPosition) / scrollHeight <= 0.05) {
          $('.box-show > .jscroll').jscroll({
            // 無限スクロールした要素のどこを使うか、tabで今選択されているタブを判断
            contentSelector: $('.box-show > .scroll-list').attr('tab'),
            nextSelector: 'span.next:last a'
          });
    }
});

// タブの切替
$(document).on('turbolinks:load', function() {
  $(function() {
    $('.tab').click(function(){
      $('.tab-active').removeClass('tab-active');
      $(this).addClass('tab-active');
      $('.box-show').removeClass('box-show');
      const index = $(this).index();
      $('.tabbox').eq(index).addClass('box-show');
    });
  });
});

// ローディング画面の
$(window).on('load',function(){
  $("#loading").delay(1500).fadeOut('slow');//ローディング画面を1.5秒（1500ms）待機してからフェードアウト
  $("#loading_box").delay(1200).fadeOut('slow');//ローディングテキストを1.2秒（1200ms）待機してからフェードアウト
});

// アコーディオンメニュー
$(document).on('turbolinks:load', function() {
  $(function(){
    $('.js-accordion-title').on('click', function () {
      /*クリックでコンテンツを開閉*/
      $(this).next().slideToggle(200);
      /*矢印の向きを変更*/
      $(this).toggleClass('open', 200);
    });
  });
});

// ページトップボタン表示
// Turbolinks無効化(詳しくは過去記事参照)
$(document).on('turbolinks:load', function() {
  // 画面をスクロールを起点
  $(window).scroll(function () {
    // ページのトップの位置をnowに代入
    var now = $(window).scrollTop();
    // ページトップから2500pxスクロールしたら以下を実行
    if (now > 1000) {
      // ボタンがふわっと現れる
      $('.pagetop').fadeIn("slow");
    } else {
      // ボタンがふわっと消える
      $('.pagetop').fadeOut('slow');
    }
  });
});
// ページトップへ戻るクリックで、スクロールして１番上に戻る
// Turbolinks無効化(詳しくは過去記事参照)
$(document).on('turbolinks:load', function() {
  $(function(){
    // ボタンクリックで発火
    $('.pagetop').click(function(){
      // アニメーションで速さを指定してサーっとページトップまで戻ります
      $('body,html').animate({
      scrollTop: 0},500);
      return false;
    });
  });
});

// スライドショー
// Turbolinks無効化(詳しくは過去記事参照)
$(document).on('turbolinks:load', function(){
  $('.slick').slick({
    // 自動再生
    autoplay:true,
    // ドットの表示
    // ,　を追加しました
    dots:true,  
    // 右左の切り替えボタン
    prevArrow: '<i class="fas fa-angle-left"></i>',
    nextArrow: '<i class="fas fa-angle-right"></i>'
  });
});