Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 79D252EEE9E
	for <lists+linux-mips@lfdr.de>; Fri,  8 Jan 2021 09:33:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726241AbhAHIcq (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 8 Jan 2021 03:32:46 -0500
Received: from mout.gmx.net ([212.227.15.18]:35019 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725791AbhAHIcq (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 8 Jan 2021 03:32:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1610094672;
        bh=jPxErSARzOQpeDIOGpyn/6sc7W8I2LOu26u5r24It3k=;
        h=X-UI-Sender-Class:Date:From:To:Cc:Subject;
        b=RjXGCMsveKS7TIXHmU9U29o+hd+onCm/golLxpxoJTAbt+UUcjBaAJQ36aWCBFWjw
         ruvCJ1SFJE5/TUzk0DDJVd/dFkkVNO8c7Aw8BNCoiqdKx+XWgI5C9aSe23uAgvklSr
         sXEyDCvI/aJXgZSNN9x6oOTWvGfKj5o+MXhqxZWo=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from Valinor ([82.128.181.212]) by mail.gmx.com (mrgmx004
 [212.227.17.184]) with ESMTPSA (Nemesis) id 1MUowV-1kXlyo35l3-00QmZA; Fri, 08
 Jan 2021 09:31:11 +0100
Date:   Fri, 8 Jan 2021 10:32:50 +0200
From:   Lauri Kasanen <cand@gmx.com>
To:     linux-mips@vger.kernel.org
Cc:     tsbogend@alpha.franken.de, hdegoede@redhat.com,
        linux-fbdev@vger.kernel.org
Subject: [PATCH 3/6] fbdev/simplefb: Add the N64's mode
Message-Id: <20210108103250.43e293897f80ae175629b3e5@gmx.com>
X-Mailer: Sylpheed 3.5.0 (GTK+ 2.18.6; x86_64-unknown-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:bApoqVzbVU0mtX64Q9PoqtXUCH8phwiGJq2Pww/PWVXpBD3YUyD
 Z9v8QWbhhxNq+2acMcb26jEqNJi9V9S78i0uHeyBNdrXibomhWw9pvVLzegtUhs06R09vXd
 K8CPcoibffQGz97VQr0BGnX1/1lci1CLU1dJSqJnApW7ZOIhFm6rAGo1Ff7TZyWKwxWlURD
 PAiefH1+/uh3BST6KxLKg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:QMSv8irzne0=:67h5VWDrIbAKtrxMipt5KZ
 RFYiYTQAKBC1QdNSd9cdpn6MElpMCqxQiIAzsc/VnFL/lTpapX70IzvxJKSxMOlSXUafGxBxx
 FbM6eq7JaIA+NjuRzUrc2bGrIhDicxIkksppv01ofM7JoGqZCZ8659ul7V1cB46TTPx2cQE1O
 RHpXaGyPDTVx7WN1XUt0VGCY0TnZEoYAv3EwRCALVMH61b+ffrzLAEzeu33BB3q3y2IpsKBCz
 FCbrm/aH5BfrOgsdkWKNstkDKZNASMh8wAPd4+Z/Brw5xvjbhGnY4pJpuEWG74oQuXB94S+9z
 tF51N1Fr+HCp/WOysbIbspHod+J9tSsIsajrTB/3TK60qByMnmgKg8XcWzpsORcoFNK8XMwPN
 3hWldXh+kRMBLmuKSpoda0wUHx0lWC81eQ2NdFoFpRhK07yQ1W4tZymRAjDIlFtNxkrKcsqbR
 tNLgdCCy9BaNPsf68vqgoxOfVkaf5GRBcpJJ1SwXu/WGxOBtxG+fqbf8nblmYppXmFta3/aDb
 0IhCpDXFJ7MBzk4glXr3p5pjfsgKyiwQXoS4YBio8d0DoOTWkcOumyXm7TjzkRBjLqu48ZWVa
 tBGzcH7JtF0+KhlhYAakiGdR837w5vu06e4nqAc5nK+tLuEW2kS2VKfYj3nWI2LQFOiDPDo8/
 zVvo7P2DZVTzifUnuecGNSRRKxAGc2i5W2EcJ9u2E+10WxswBRIIYgScXw76Mej9/cvRyzPU+
 BCHhLCwQTLwIU8DsHGQVPf+LXX1Rtt9o6o7Cp2sivYIH5nYTqpr+iOlCKBC05o38/KSzVHnAE
 PO9m9xV9CoSBlStATYPP9/ivbqcyKEvZgs3NDdtQrB1ZKvuAxSdZVAf+BJ/HoEFqP4ig+2D11
 KbHqK6DsjE8N7C3Qp1PA==
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

No changes for this patch, just refreshing as part of the series.

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

