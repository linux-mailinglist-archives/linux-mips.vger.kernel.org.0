Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F6262F7D74
	for <lists+linux-mips@lfdr.de>; Fri, 15 Jan 2021 15:01:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732795AbhAOOA6 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 15 Jan 2021 09:00:58 -0500
Received: from mout.gmx.net ([212.227.15.15]:52153 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732105AbhAOOA5 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 15 Jan 2021 09:00:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1610719162;
        bh=G4W1nvfaopIQmtPt0FO0uFQQwxDjaHOyUzzzx6MIUqo=;
        h=X-UI-Sender-Class:Date:From:To:Cc:Subject;
        b=h5YtSD5BsFq1x4ZdVE80QCWnQwph/X5JzSlU1ViwZ2nD8RIRFsQPlkJ6qFskRg8Vt
         wXAHs8sD+PVtc63UW21YmVA/KQ1ScfWn+85b2ox1gEvk3rasrM77Wt2D7a5gr3w+d+
         /SZ5N/F0ThLRI7ABc0qttf2GgkAXOkeIW1pYrGM0=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from Valinor ([82.203.161.65]) by mail.gmx.com (mrgmx005
 [212.227.17.184]) with ESMTPSA (Nemesis) id 1MI5Q5-1lEzoT2GCV-00FFkM; Fri, 15
 Jan 2021 14:59:22 +0100
Date:   Fri, 15 Jan 2021 16:01:02 +0200
From:   Lauri Kasanen <cand@gmx.com>
To:     linux-mips@vger.kernel.org
Cc:     tsbogend@alpha.franken.de, hdegoede@redhat.com,
        linux-fbdev@vger.kernel.org
Subject: [PATCH] fbdev/simplefb: Add the N64's mode
Message-Id: <20210115160102.cf4c85db9f815758716f086f@gmx.com>
X-Mailer: Sylpheed 3.5.0 (GTK+ 2.18.6; x86_64-unknown-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Z3Q4bW3JfBO4ntNAoFIUX5Rr52/VqOeLLc8FlbtS0JvAI1IQOg/
 SikpUXt+h0Qd6A2y1pMOx3KeeWS7O7bciUoQWxj63El7r2M043tFiFxjvtgcX2jcz5Fi3lL
 TP1T8h1x/8S2N6fqRyrmu02ibGkEZUPqGlGnzt9h8cLCWk1PFwWscBlSKROf6j7mjsmt5Lu
 yynKRc7EKYF3trcGzOYYw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:oXVfAai5axg=:+CyOB5U+7YqwApeXnKWset
 fUKSX8fH5Xr0tqye/8PCYfj0m9yW8+vgd/swEW3ciAXf5l+bsKCQaV7hL/n2Ebybf1nb2ErkS
 W25+ekCQxUCS2Mm08+lyglvf1pSmBzQtK7/GYQLg2tf1r4/iED6vrjVKtuQ6tX9foAzyLEa4y
 263IL4vn1iL7hC/zvdyweC0j6iXAvXXaYVenpnHlf9CwabWu2DUL41dlHw+DnOmnLcEAl/XW5
 JeXb/tysWU5ZtLV5PQuRMO57H4Al8Iz5mqwgsp5/Oxpu3MD7Uz6E4lWyQB7sPA7PW/kGeloJH
 df9+Z7MPsaO6d063eUCVHIMTXiBFDC05fOsqaSTTJ+zCWnZzZzCVNMCOSYNsHzf4YZ69iIAiS
 UpiIkbVb99mGbSX9QFNM8nQm0BzVYlt752REpef7d7gCXjQ79imYlyT3NB4lnR3JNQjUf7uCH
 0x/4/RxEQk0IbsHlO7c74fsMWc6rVKnMOxu3JtaSX7TKTDlTlp5udPp+akshwTQCnBGOcLtTr
 CqnkoMC5sbSKe1ktq8cvIYEOT9p4zxejFatgZWQ5cHmQeuIRe1SFzMD95GEuP2UOGC1WjDWGk
 ZXj7EWvEpq/qlDVcFYBjq/UqerGXzgG3rEWVRcCSdbo0dI5X7RtVZX2h3Sqt9xH0gxVL1Lrwb
 GiFrFT8lWqaerMs6UYRWu9cGwNBBHobbENAF5Urg3Tk9k/6bV9FiZ1l+Rr3z435kmGTvkhsAN
 MYc+IbtvnlqSgtaQBe1n2F+l3H3YVD2+BdQyNuZenDhXGd1Vk7OKaxDpCNy0D/IT7a1YqZpE6
 mUt04p1xBImjSIxqkmtjjJc4gwO/J9FXPvKISMV4vVkbBntWauK0fF4WeARSQcYeLfoh8EB+6
 R9IZWDkaOYvP1ZD3k6WQ==
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Signed-off-by: Lauri Kasanen <cand@gmx.com>
=2D--
 include/linux/platform_data/simplefb.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/platform_data/simplefb.h b/include/linux/platfo=
rm_data/simplefb.h
index ca83376..27ea99a 100644
=2D-- a/include/linux/platform_data/simplefb.h
+++ b/include/linux/platform_data/simplefb.h
@@ -16,6 +16,7 @@
 #define SIMPLEFB_FORMATS \
 { \
 	{ "r5g6b5", 16, {11, 5}, {5, 6}, {0, 5}, {0, 0}, DRM_FORMAT_RGB565 }, \
+	{ "r5g5b5a1", 16, {11, 5}, {6, 5}, {1, 5}, {0, 1}, DRM_FORMAT_RGBA5551 }=
, \
 	{ "x1r5g5b5", 16, {10, 5}, {5, 5}, {0, 5}, {0, 0}, DRM_FORMAT_XRGB1555 }=
, \
 	{ "a1r5g5b5", 16, {10, 5}, {5, 5}, {0, 5}, {15, 1}, DRM_FORMAT_ARGB1555 =
}, \
 	{ "r8g8b8", 24, {16, 8}, {8, 8}, {0, 8}, {0, 0}, DRM_FORMAT_RGB888 }, \
=2D-
2.6.2

