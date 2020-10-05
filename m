Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2FD98284160
	for <lists+linux-mips@lfdr.de>; Mon,  5 Oct 2020 22:37:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729877AbgJEUgp (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 5 Oct 2020 16:36:45 -0400
Received: from mout.kundenserver.de ([212.227.126.131]:43937 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729828AbgJEUgZ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 5 Oct 2020 16:36:25 -0400
Received: from methusalix.internal.home.lespocky.de ([92.117.55.152]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MUD7D-1jyPZM0wd9-00RHu7; Mon, 05 Oct 2020 22:35:51 +0200
Received: from lemmy.internal.home.lespocky.de ([192.168.243.176] helo=lemmy.home.lespocky.de)
        by methusalix.internal.home.lespocky.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
        (Exim 4.94)
        (envelope-from <alex@home.lespocky.de>)
        id 1kPXD1-0004W6-To; Mon, 05 Oct 2020 22:35:49 +0200
Received: (nullmailer pid 10343 invoked by uid 2001);
        Mon, 05 Oct 2020 20:35:38 -0000
From:   Alexander Dahl <post@lespocky.de>
To:     Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Alexander Dahl <ada@thorsis.com>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Alexander Dahl <post@lespocky.de>, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-amlogic@lists.infradead.org, linux-mips@vger.kernel.org,
        Jisheng Zhang <Jisheng.Zhang@synaptics.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Subject: [PATCH v7 06/12] ARM: dts: berlin: Fix schema warnings for pwm-leds
Date:   Mon,  5 Oct 2020 22:34:45 +0200
Message-Id: <20201005203451.9985-7-post@lespocky.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201005203451.9985-1-post@lespocky.de>
References: <20201005203451.9985-1-post@lespocky.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scan-Signature: 08386759e7be537865a5b4fcb90d540e
X-Spam-Score: -2.9 (--)
X-Provags-ID: V03:K1:guPzpHouZYsDItxJ2VwmbE1hLmLueuILeAA0xXEMRTr8ny0z7+r
 M3VxkcQRzNq7TcNvxUTN44v398fyE6l1UwsNy+sOkJ55ADAi0UH+IZ1CLzNvc0TdFoNddbM
 rSui4EMI2aeOPF4YWZqm3dTcuSii2/p926KHSS5wULYXMeaKLglCu/vTDZath05MJAqmrVX
 XjDGCBaLmQBJgWppPaTpw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:4lr8xTdu67U=:hzBHJ/QNqSAwgrq3R+eD8H
 WuPjw6nUaTamq6r5jFDNam3zhDEfNFKmVxHso0zTYy1EHtHXpuoNMzsyL7/x8Tubpeu5X624c
 nBjBQ6acovXif9BSvybV5yl6EsbyoZvOnQi6A45UeM2FtsZF+XRwmAkH+NUFGl48QUtgycpuz
 SvhAihSpmLNRGUY72PdMYqcV0c1W368GFdnA88Vm2x0Td4nukNtlzSC0UZOZ2F7EnCKZwaYJR
 xu8L6eGfxpvwp8sEmBkEMKG0fXLPNw3GYEnPNuYXpCp2b25QCWDUJAL1K9T/evr5MRqBwXHBh
 GvhO0vlcny96SWQMuCyGd5LMvTIbWbWMc75hO11QPPgVGLIn7HMK1SmRCNjuTdHxLv7YIg3zV
 KVvz0Q7yk7bKuAnmNrNps93KCm7lNDaUlbN9PbGjaPg7N/KbnKeO3tmsIwScdtxneRhevCA7s
 HceGkoxPWA+8tqiDqMCI5ApYARI+REun0fY5gU1pidOSFVeeoAVBtZxH2A0rPY50La3mwLr/e
 6zolFkFt9rbI8B+emPZK8gzOVHGbecnqj4oIHescM8K2cNBQ5zhbWQsyL8j1YN7j+Eni4Kiys
 cbqc6miRKyUBwEkvt/4RPnVtBAz4nt0mEw5x0VSFI7mXjtRKmRq0QeNOVHpNlv2ubeUdvYPmQ
 gzD8lOe52bfrVOVGkpRKiAdHxCE8rRNrt7LGgwZDSsDh3rWXQpD55Rkz9GCw1ahBhybicw62w
 Mcbxs35mnFh92qROSR3s5dpEAdjmARpTXEDi1GezGvsP1kUWntamj7dt8ZSE3ykoWB30M7pKF
 acFVedDXKtG17m/5RclNm5OMh4IqqVDy7Ivmo8JKPBZgydARKA9GHUG0xiT4S7VLGZVVHMh
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The node names for devices using the pwm-leds driver follow a certain
naming scheme (now).  Parent node name is not enforced, but recommended
by DT project.

  DTC     arch/arm/boot/dts/berlin2cd-google-chromecast.dt.yaml
  CHECK   arch/arm/boot/dts/berlin2cd-google-chromecast.dt.yaml
/home/alex/build/linux/arch/arm/boot/dts/berlin2cd-google-chromecast.dt.yaml: leds: 'red', 'white' do not match any of the regexes: '^led(-[0-9a-f]+)?$', 'pinctrl-[0-9]+'
        From schema: /home/alex/src/linux/leds/Documentation/devicetree/bindings/leds/leds-pwm.yaml

Signed-off-by: Alexander Dahl <post@lespocky.de>
---

Notes:
    v6 -> v7:
      * split up patch (one per sub arch)
      * added actual warnings to commit message

 arch/arm/boot/dts/berlin2cd-google-chromecast.dts | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/berlin2cd-google-chromecast.dts b/arch/arm/boot/dts/berlin2cd-google-chromecast.dts
index 56fa951bc86f..c1d91424e658 100644
--- a/arch/arm/boot/dts/berlin2cd-google-chromecast.dts
+++ b/arch/arm/boot/dts/berlin2cd-google-chromecast.dts
@@ -34,19 +34,19 @@
 		linux,usable-memory = <0x00000000 0x20000000>; /* 512 MB */
 	};
 
-	leds {
+	led-controller {
 		compatible = "pwm-leds";
 		pinctrl-0 = <&ledpwm_pmux>;
 		pinctrl-names = "default";
 
-		white {
+		led-1 {
 			label = "white";
 			pwms = <&pwm 0 600000 0>;
 			max-brightness = <255>;
 			linux,default-trigger = "default-on";
 		};
 
-		red {
+		led-2 {
 			label = "red";
 			pwms = <&pwm 1 600000 0>;
 			max-brightness = <255>;
-- 
2.20.1

