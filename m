Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EBB6A27F657
	for <lists+linux-mips@lfdr.de>; Thu,  1 Oct 2020 01:53:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731171AbgI3XxN (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 30 Sep 2020 19:53:13 -0400
Received: from mout.kundenserver.de ([212.227.126.134]:43921 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725372AbgI3XxN (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 30 Sep 2020 19:53:13 -0400
Received: from methusalix.internal.home.lespocky.de ([92.117.51.117]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MtO06-1khDwh18e6-00utdP; Thu, 01 Oct 2020 01:47:41 +0200
Received: from lemmy.internal.home.lespocky.de ([192.168.243.176] helo=lemmy.home.lespocky.de)
        by methusalix.internal.home.lespocky.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
        (Exim 4.94)
        (envelope-from <alex@home.lespocky.de>)
        id 1kNlox-0007Zd-0j; Thu, 01 Oct 2020 01:47:39 +0200
Received: (nullmailer pid 7778 invoked by uid 2001);
        Wed, 30 Sep 2020 23:47:38 -0000
From:   Alexander Dahl <post@lespocky.de>
To:     linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-amlogic@lists.infradead.org, linux-mips@vger.kernel.org
Cc:     Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Alexander Dahl <ada@thorsis.com>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Alexander Dahl <post@lespocky.de>
Subject: [PATCH v6 4/7] ARM: dts: at91: smartkiz: Reference led node directly
Date:   Thu,  1 Oct 2020 01:46:34 +0200
Message-Id: <20200930234637.7573-5-post@lespocky.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200930234637.7573-1-post@lespocky.de>
References: <20200930234637.7573-1-post@lespocky.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scan-Signature: 47063c0bd3b0440d119657da58bc7562
X-Spam-Score: -2.9 (--)
X-Provags-ID: V03:K1:kNQzKotdRff+jmTK4enfW2P8VC+lN5Mm6sK3dTcCWyI7KqF5K0w
 hs9y5hvIdZxbvwjGV6d1MbjwF+93wWztobk2nTO8bv4NKOk4hYWJzlm7+DToWFTqnOe+mK2
 bMDeUKjAMcccYMA6iDl3Pt9XXvtPQp57BkpOH8Ls3rFw2QjTLF+FnfU+Bqyjox9GG0VbD2f
 VwLnWtvbe25tfrYuE59KA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:Ag8cKVzSK4o=:nig//OB/+xPgN1nWhkNIYw
 v7wIGhv3IDox3aVh5Obs0TV6RN/fL5bvn/w2DdkNmwM3LaR4G93ge7/araQj8lx0cdw3GvfST
 5IFCSeNOcxANVmsa7uLc6A9R8akK5iCUPxa1ke20MRR5PMLxjltKkwXIz6+uqXI5nUhABmNFZ
 02xs3EPh2eIDmWXnvdzbLVlwr2/LwME1sCs+ANqzZJgektH0d4LARofnOO6SzLAlCNLfv9Rh+
 zoCVCF19lQ7pCMVHauehD/L0FtDXmzEYMTm+bRZ2OcogB/+uZQu9ymdwgsqJiELpmnwR0VXYS
 rruVEUJ5zlEwbI3b/ebqP05mbqABLq39UEFr8xDhfOokubhDzPXZYk5CVZPBG55+MusbwAeiY
 1ZRSr/Mv4jjYWQPE6i+5C6SsHDZHswXQ4xBES9oOEE6JpIOrdqWRnVjQOrICBAql7rAai+4XU
 3LFwKYj2NYmQq1OahSCAt+KmINd6fuQGYooIyfQs8rebnMd1oPV//WT+N8OR2+U3je9jASwa3
 qkT7U7UyHi+rFhzXJ3TEpRe9Ep7Ph43D7jOEjcMPnfbHJmSU5B3tgDPpQouJ0zQzaXAVymGkw
 Q2wjjzYfBQ4w7Rjw7EjvXZh2reWsFASuXRsXCCm4yhIn42GH/cDtZjYFsa0+kylOBoVl+5576
 eVqA11fb4Ldig2oCHtlWdcoP9lK0vt0Mb5AussPbrvplDfzNTwPphdIVGQQBq43xMdVP/q5ZK
 Zgcu4nab89nP4UXBYQJqvXKP6PuI8mrcrE+4g27VGcb+lxzpM7gxXvhY9peRB1rl5u2jQhB5f
 VQxPurUoXwdE8+GKu0+6WU6CYNSTuyn4N6nlzgspMSa9VZ0Xom2QgFNZw7Y2Bs/x8YiST8acJ
 IsHjGTOmdsTt5QnRapcvqqDv6jgHPxbB0l0u/WZL+Pzqho9XYVKNL5p7UQjkxaUhUOS73J+4L
 q1LvHTrz3ysheoK+AJeIPY+pHfm1khj/SrE51wNdyciL4dUzNz6mHZvAyjZnPAdkSJwRQg46P
 w52BG47TUQjSX0IcH/EyWIMaelJhBodUyBAeojAdbOS1
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Do it the simple way like for the other kizbox boards.  This will allow
renaming the led controller node name later without breaking things.

Signed-off-by: Alexander Dahl <post@lespocky.de>
---

Notes:
    v6:
      * added this patch to series

 arch/arm/boot/dts/at91-smartkiz.dts | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/at91-smartkiz.dts b/arch/arm/boot/dts/at91-smartkiz.dts
index 106f23ba4a3b..b76a6b5ac464 100644
--- a/arch/arm/boot/dts/at91-smartkiz.dts
+++ b/arch/arm/boot/dts/at91-smartkiz.dts
@@ -84,10 +84,8 @@
 	status = "okay";
 };
 
-&leds {
-	blue {
-		status = "okay";
-	};
+&led_blue {
+	status = "okay";
 };
 
 &adc0 {
-- 
2.20.1

