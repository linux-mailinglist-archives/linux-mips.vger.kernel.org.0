Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 99E9A2F4E43
	for <lists+linux-mips@lfdr.de>; Wed, 13 Jan 2021 16:16:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727106AbhAMPO7 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 13 Jan 2021 10:14:59 -0500
Received: from mout.gmx.net ([212.227.15.18]:39473 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727097AbhAMPO6 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 13 Jan 2021 10:14:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1610550804;
        bh=BdwxHxrB1Im1p2gJdU7lopAgVR1ZdU52H6JL1Np4VBE=;
        h=X-UI-Sender-Class:Date:From:To:Cc:Subject;
        b=Rk58TbNP00KDrJOkxum5OeOFQan7ybTPitUFawylIpG5BislvkpT1j5r9jNHX2lRX
         n8imEzDqlCRRFurs8hrEJxVgdM1+09sjWE6Dnr4t/jvkL8DRf2ACyGhbW5IEdoF/qq
         J4iuupBMDeUv27F+CYzWqpVuXX53xSA5+Mpe224w=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from Valinor ([82.203.161.65]) by mail.gmx.com (mrgmx005
 [212.227.17.184]) with ESMTPSA (Nemesis) id 1N9dsV-1juagr2Rdd-015bWP; Wed, 13
 Jan 2021 16:13:24 +0100
Date:   Wed, 13 Jan 2021 17:11:59 +0200
From:   Lauri Kasanen <cand@gmx.com>
To:     linux-mips@vger.kernel.org
Cc:     tsbogend@alpha.franken.de, hdegoede@redhat.com,
        linux-fbdev@vger.kernel.org
Subject: [PATCH 3/6 v6] fbdev/simplefb: Add the N64's mode
Message-Id: <20210113171159.ed46ea46b7af0cc6cf2a85d8@gmx.com>
X-Mailer: Sylpheed 3.5.0 (GTK+ 2.18.6; x86_64-unknown-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:LwetTB+MxlEVHEKm7us3JYdkzhTBNZNn+rYCBtcsE3BxifyJLM/
 uOFWf1RFlL5IwAB4zbhfsZU0faUgyL336vvUBAXBf18sEN9IZdwaKvC+4w/ZYIJs8uTy0zy
 hY5GWxrT02g6Bit1jhoOAQ8LDKBZN2LyfTfe+t1KZUPvObcfTJ5oq5+YUxxSn3MnypQ/b9p
 Qdqm0LLosCyw5DqD+Y7RQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:+VujxkjW69o=:g9uhkoSra1LLU4UF51Y9JF
 4Nvi7yc4n7mvSRwmOCo+qDDtG/g+CEJZgWxp8mYxQSJVODVkKu8f9A1GVotRmGY72/L6w/pMN
 ce5ozqVo2IPdliNr854bv5snJDHop5GkJHlDqiYjIRYOs+Xg01k7Vdcx73nIq46Y/lx6kugkj
 d1CaIcg1+I62UbbRobksgVVuaeZ6ufD+6qc/sa5pic58r2XJUWtMsUnMAjf0efKunhI121kmg
 WgrToa3XSRXiC8suIaoLUA4FTrN7UxBRNsJHHI3v7vDfLPZURpD/NT7CLcajSNRPRqM38I7NM
 r3Mm4H+TIcjgk//CIZcpK4J88kjyEgXyc4aftLwdIgDyZ8qnfS/p+Bg6bNf08uWp4OXsYya8x
 k+tDdw4VWFcmNWhWf3MqlV4BJDyoWhyiC6Rwf7YlFqZjv7f57Tl4WZAjGgElT/0OLZzFR04+p
 Fpg6heQBsAKh4aQsssHQtpPGu/EGqVF7nRVxh1dyLvAhUieHGT3Aq7YnoE697mKVAcMt82w36
 uYL4uq3ElVAbAYJyxhSXfePXxdlANDG+4E1kTfFMUPJR3HTAOgp1Nst/2Q8ZpMleUGqbJ8ziy
 JRsi2d27E6159crkHOwkzWqmamPGjASbGeE4Amy2Xh1TCVDTwcVCyWhg1zvaHFJ7kYpbyj79b
 pIkP4FyAXSXCbv0z5VY9IEmHn7pFkCEKABwXQoKKBItg/EQmJphiFubpTZwxHZ2vdmsAhEW0a
 TV/P1WUYTFC6Yb8+AgzRyWnzf9zV2tZZgywAVF7V4ATxbR4n0fypmHJK68K+xYS2l4y2LYSyp
 go01CiZBLGPwJtkfiEQYg97HJj+7IFXGLjZyZpZhhq52ztSMXfx5o5G5LrZcFkdn89Kxi6Rz/
 8T1SV7cPbIEwuXBZF/hw==
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

