Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B00D92E9646
	for <lists+linux-mips@lfdr.de>; Mon,  4 Jan 2021 14:46:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726950AbhADNqO (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 4 Jan 2021 08:46:14 -0500
Received: from mout.gmx.net ([212.227.15.19]:33459 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725921AbhADNqO (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 4 Jan 2021 08:46:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1609767881;
        bh=eIQR0/N3yU5g3Ck+QxO7wW/o9Eq3Bvh+w1VitRCoW7Q=;
        h=X-UI-Sender-Class:Date:From:To:Cc:Subject;
        b=QYgftcepcw0rVG1d+G0KTaj5YuZId3nihP2xlRAhIqILlfL1ruHIUlkgU4w4Xs27e
         EZwMXt3EEo8vHBsmJkLu5aC8pAiCF5gRJanUveOtE9t1X/7ELPvwJoye60bnXZaBk8
         HoWqVAHA+vyZibAmu4DqhjPhv1BQkGegFkrjmnNc=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from Valinor ([82.128.181.212]) by mail.gmx.com (mrgmx004
 [212.227.17.184]) with ESMTPSA (Nemesis) id 1MbRk3-1kPH8L3gWv-00bpB1; Mon, 04
 Jan 2021 14:44:41 +0100
Date:   Mon, 4 Jan 2021 15:46:18 +0200
From:   Lauri Kasanen <cand@gmx.com>
To:     linux-mips@vger.kernel.org
Cc:     tsbogend@alpha.franken.de, hdegoede@redhat.com,
        linux-fbdev@vger.kernel.org
Subject: [PATCH 3/6] fbdev/simplefb: Add the N64's mode
Message-Id: <20210104154618.06e1df16b234498bf9145223@gmx.com>
X-Mailer: Sylpheed 3.5.0 (GTK+ 2.18.6; x86_64-unknown-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:visL/lvIkrIc9DmTqd2atVUszYVVQmgl5wMOW8XIE9PuySJzy0f
 bPvCR2pzMUii0hkJ3bX0Zziv+jWjmjLALp5jQdPYpJ0RhJmMwqEqHOnsrq8m8MhzWIkViPo
 ens4stMxGba11x+kbVJkDw4mjw3A7i2u9e4EDHk1qXV3L2LevnRLB+/DVFwwQMjSBbq2urU
 EtB7P2QR2hhIKiyQP2+nA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:ryceb86etHc=:p7kEia0It8kqPjswEqchNR
 mRwhNaDUH3tariPmg4eGY90zSjmuwXLP7fU5CY98piOIWYQfhq4FZTz7i2jBlDmmPoa9lqC4X
 pUBzfMb5yHlqgPA6LAKN+NZOLKqU39e6eyk0NUBZOOaxZv0E3pkJQEQhOokL4UMzsJEzln7Ql
 OIM0KhyuY1nwaFbknbK9mkJPM3dIcOAK+lwCi0OTTC5zEXy1+25O+PAuIH9mmpWJ+5gqpHDv8
 AkvL5C1V5gX4gztyVaK34dTUo3BtTEJY7ZOGvsvsdFXVshFLlaYr3zgyXUwau1GQivfCrO8jZ
 Q/yxmxeHfusX7h+gHIDbObAi0ggZhteFzPbe1L3fAmOoUxjSr9m+nskpw+uksCb6GaLbnr5Kv
 c9AVLhdE3lDhTodDN1W3VWfI9Iy3jMZP0M/VQBrgdl/dJ7XqYxCZ5wVnHAdL91AH4sCa5EZqC
 bCKoqMqGI3fG2xKljrvA5bAh0ZGSevFZR7BrOE0ugNESnI9R+kedqkR+BdLoO0rYMemF7Mmjl
 8aZu3wgdYeuIJgtm1PZ1uZ538lorMQyOPWKWgTwBwH3divylLJMOBHpNng98uG4y+LIrFNnL9
 voFbsmU3Bg+WhQIqcHUGCW1PU97U8HCaOBFVVQkTe1hRj5CFFw7ACNjmghwqegKqdg0o0N6I/
 ambySFLqekZ1fr7mcM9TJuZcKLIzi78RCLY6sGEyJ6dCWM0JAZ450o22uW2A4LqOnym4BrqEx
 xi33YifojXf9ou3BW2sxwGvudWa9+Vh4p0cwGh86cjrczqBIBtzk61RRHwIfDHOzeBPPHz3ap
 YKp+7CS8sjfGIHXIhdLmrGbYkMJT3I8GSiHbDlodxhmoBjx8458vLbCUE6GouFJkbQYHY0Jp8
 6KeUWnPHPDaxlNwyMARQ==
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

By keeping it separate for the platform, we save 748 bytes.
This brings simplefb to 2.5kb from 3.2kb, when a native fb driver
was 1.5kb.

Signed-off-by: Lauri Kasanen <cand@gmx.com>
=2D--
 include/linux/platform_data/simplefb.h | 7 +++++++
 1 file changed, 7 insertions(+)

fb folks: the rest of the series is on linux-mips. I'm not sure which tree=
 what
goes through.

diff --git a/include/linux/platform_data/simplefb.h b/include/linux/platfo=
rm_data/simplefb.h
index ca83376..c9d4f2c 100644
=2D-- a/include/linux/platform_data/simplefb.h
+++ b/include/linux/platform_data/simplefb.h
@@ -13,6 +13,12 @@
 #include <linux/types.h>

 /* format array, use it to initialize a "struct simplefb_format" array */
+#ifdef CONFIG_MACH_NINTENDO64
+#define SIMPLEFB_FORMATS \
+{ \
+	{ "r5g5b5a1", 16, {11, 5}, {6, 5}, {1, 5}, {0, 1}, DRM_FORMAT_RGBA5551 }=
, \
+}
+#else
 #define SIMPLEFB_FORMATS \
 { \
 	{ "r5g6b5", 16, {11, 5}, {5, 6}, {0, 5}, {0, 0}, DRM_FORMAT_RGB565 }, \
@@ -25,6 +31,7 @@
 	{ "x2r10g10b10", 32, {20, 10}, {10, 10}, {0, 10}, {0, 0}, DRM_FORMAT_XRG=
B2101010 }, \
 	{ "a2r10g10b10", 32, {20, 10}, {10, 10}, {0, 10}, {30, 2}, DRM_FORMAT_AR=
GB2101010 }, \
 }
+#endif

 /*
  * Data-Format for Simple-Framebuffers
=2D-
2.6.2

