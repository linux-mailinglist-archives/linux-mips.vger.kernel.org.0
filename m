Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B3A1A1819C6
	for <lists+linux-mips@lfdr.de>; Wed, 11 Mar 2020 14:30:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729590AbgCKNaq (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 11 Mar 2020 09:30:46 -0400
Received: from mo4-p02-ob.smtp.rzone.de ([85.215.255.81]:8299 "EHLO
        mo4-p02-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729552AbgCKNap (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 11 Mar 2020 09:30:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1583933442;
        s=strato-dkim-0002; d=goldelico.com;
        h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=GdjmaOpO8Y3WU4rFoDIjKcLngUYzQxklDSD8RGkNqKM=;
        b=eFHlFzdQt3jZW7BzBb+EitGOR1sZWjUdS8wvw7ja4b3UxF0LmmMh+RN3mIVJ8DPMWo
        BpkjIHfQN61plZgvIA6BtZF3EgOl8TJW3benyJPYX6TwphR3hILSHdsSjX5UQ/2cCJcp
        scn7ebPyMf5fvC/L8vDL06DiBgi6G0nH9IaZdgB5YahzhrTbxPej9hueW+64aeB2E/Ox
        F8mU3QhFj7V7gqBM8PzAB45oqA5ngD0+dK9TV0lshZ9q22X/gxD08aj/vl+bifktdcWU
        L3nX3wjnY1qgdEpnH4sF+rZ5DcVKbjkwovuCPxuwicL6qnlztv5SfxLoA8JiBhLMZhTD
        BSxA==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMgPgp8VKxflSZ1P34KBj4Qpw9iZeHmMnw43lIA8="
X-RZG-CLASS-ID: mo00
Received: from imac.fritz.box
        by smtp.strato.de (RZmta 46.2.0 DYNA|AUTH)
        with ESMTPSA id y0a02cw2BDURyeO
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
        (Client did not present a certificate);
        Wed, 11 Mar 2020 14:30:27 +0100 (CET)
Subject: Re: [RFC v2 6/8] MIPS: DTS: jz4780: account for Synopsys HDMI driver and LCD controller
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Type: text/plain; charset=iso-8859-1
From:   "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <1583932809.3.0@crapouillou.net>
Date:   Wed, 11 Mar 2020 14:30:26 +0100
Cc:     Paul Boddie <paul@boddie.org.uk>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andi Kleen <ak@linux.intel.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "Eric W. Biederman" <ebiederm@xmission.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-mips@vger.kernel.org,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Discussions about the Letux Kernel 
        <letux-kernel@openphoenux.org>,
        MIPS Creator CI20 Development 
        <mips-creator-ci20-dev@googlegroups.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <81CAD3B7-0467-4F67-B379-76795B147497@goldelico.com>
References: <cover.1582913973.git.hns@goldelico.com> <04b485165f38744816a0446e95150cafdeb716ee.1582913973.git.hns@goldelico.com> <1583177253.3.5@crapouillou.net> <F29E9DCC-29BC-4B88-9288-3E53BF8423C6@goldelico.com> <1583932809.3.0@crapouillou.net>
To:     Paul Cercueil <paul@crapouillou.net>
X-Mailer: Apple Mail (2.3124)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Paul,

> Am 11.03.2020 um 14:20 schrieb Paul Cercueil <paul@crapouillou.net>:
>=20
> Hi Nikolaus,
>=20
>=20
> Le mer., mars 11, 2020 at 13:43, H. Nikolaus Schaller =
<hns@goldelico.com> a =E9crit :
>> Hi Paul,
>>> The JZ4780's LCD controller is much newer than the JZ4740 one, so =
even if it works with the "ingenic,jz4740-lcd" compatible string, you =
want it as a fallback.
>>> So this should be: compatible =3D "ingenic,jz4780-lcd", =
"ingenic,jz4740-lcd".
>>> That means the YAML should be updated too.
>> I have started to look into jz4780 HDMI setup again.
>> Well, there is no driver compatible to "ingenic,jz4780-lcd" so far
>> and it is questionalbe if we need a different one.
>> I think we should rather make the driver also compatible
>> than adding a fallback to ingenic,jz4740-lcdto the DTS.
>> The reason why this is better even if both LCDC are almost
>> compatible is that the jz4780 allows for much bigger displays
>> and therefore should have its own jz_soc_info with 4k x 2k
>> as maximum.
>=20
> Sure, feel free to extend the driver.
>=20
>> Next I tried to find out if the LCDC are really compatible.
>> Well the jz4780 has two lcdc instances but they are separated
>> by the reg addr. Next, there are unique features (like picture in
>> picture with alpha blending) but those are probably disabled
>> if not programmed from reset state. This may become a reason
>> to separate or augment the driver for the jz4780 but at the
>> moment we can ignore that.
>=20
> Two LCDC instances -> two lcd-controller@... nodes. It's that simple.

Indeed :)

>=20
> The other features you listed are outside the LCDC, so outside the =
scope of this driver.

Well, in the description they are mixed but I think we do not have
to care about now.
>=20
>> There are also subtly different bit definitions and register
>> widths (e.g. 24 bit in addition to 16/18 bit modes or more bits
>> for the sync position) but it looks as if the ingenic_drm
>> driver already handles this.
>> Then I tried to read back the registers. Strangely they
>> are all 0x00000000. So there is no programming of the
>> lcd-controller in our DT setup with HDMI at all!
>=20
> How did you read them?

I used devmem2 (may be an omap tool I have recompiled for MIPS - it uses =
/dev/mem).

> Do it from the regmap: should be "cat =
/sys/kernel/debug/regmap/13050000.lcd-controller/registers" (not sure =
about the path)

Well seems to give the same result:

root@letux:~# cat =
/sys/kernel/debug/regmap/13050000.lcd-controller/registers
00: 00000000
04: 00000000
08: 00000000
0c: 00000000
10: 00000000
14: 00000000
18: 00000000
1c: 00000000
20: 00000000
24: 00000000
28: 00000000
2c: 00000000
30: 00000000
34: 00000000
38: 00000000
3c: 00000000
40: 00000000
44: 00000000
48: 00000000
4c: 00000000
50: 00000000
54: 00000000
58: 00000000
5c: 00000000
root@letux:~#=20

>=20
>> I also checked that ingenic_drm_probe() is called and
>> returns successfully 0. It also reports that a /dev/fb
>> has been created:
>> [    7.908830] ingenic-drm 13050000.lcd-controller: fb0: =
ingenic-drmdrmf frame buffer device
>> But for example ingenic_drm_encoder_atomic_mode_set() is
>> never called which should write some registers of the LCDC.
>> I only did see some calls to ingenic_drm_encoder_atomic_check().
>> This of course explains why we have no HDMI signals despite
>> proper HPD and a /dev/fb0. Because the LCDC is not being
>> programmed.
>=20
> It won't be called until the HDMI driver says that the cable is =
plugged, and there's a client application (e.g. fbdev emulation) =
running. So the problem is most likely within the HDMI driver.

Ok!

The HDMI subsystem says (with some printk inserted) on cable =
unplug/replug:

root@letux:~# [ 3894.370706] dw_hdmi_update_power
[ 3894.373984] dw_hdmi_update_power: hdmi->force=3D0
[ 3894.378759] dw_hdmi_update_power: hdmi->disabled=3D0
[ 3894.383756] dw_hdmi_update_power: hdmi->bridge_is_on=3D1
[ 3894.388947] dw_hdmi_update_power: hdmi->rxsense=3D1
[ 3894.393831] dw_hdmi_update_power: force=3D2
[ 3894.397895] dw_hdmi_update_power: hdmi->bridge_is_on=3D1
[ 3894.403200] dw_hdmi_phy_update_hpd
[ 3894.406784] dw_hdmi_update_power
[ 3894.410054] dw_hdmi_update_power: hdmi->force=3D0
[ 3894.414766] dw_hdmi_update_power: hdmi->disabled=3D0
[ 3894.419611] dw_hdmi_update_power: hdmi->bridge_is_on=3D1
[ 3894.424928] dw_hdmi_update_power: hdmi->rxsense=3D1
[ 3894.429699] dw_hdmi_update_power: force=3D2
[ 3894.433876] dw_hdmi_update_power: hdmi->bridge_is_on=3D1
[ 3894.439068] dw_hdmi_phy_update_hpd
[ 3894.452316] dw_hdmi_update_power
[ 3894.455596] dw_hdmi_update_power: hdmi->force=3D0
[ 3894.460150] dw_hdmi_update_power: hdmi->disabled=3D0
[ 3894.464967] dw_hdmi_update_power: hdmi->bridge_is_on=3D1
[ 3894.470131] dw_hdmi_update_power: hdmi->rxsense=3D1
[ 3894.475051] dw_hdmi_update_power: force=3D2
[ 3894.479111] dw_hdmi_update_power: hdmi->bridge_is_on=3D1
[ 3894.484423] dw_hdmi_phy_update_hpd
[ 3894.488007] dw_hdmi_update_power
[ 3894.491278] dw_hdmi_update_power: hdmi->force=3D0
[ 3894.495982] dw_hdmi_update_power: hdmi->disabled=3D0
[ 3894.500823] dw_hdmi_update_power: hdmi->bridge_is_on=3D1
[ 3894.506139] dw_hdmi_update_power: hdmi->rxsense=3D0
[ 3894.510895] dw_hdmi_update_power: force=3D1
[ 3894.515063] dw_hdmi_update_power: hdmi->bridge_is_on=3D1
[ 3894.520252] dw_hdmi_poweroff
[ 3894.523284] dw_hdmi_phy_disable
[ 3894.526480] dw_hdmi_phy_power_off
[ 3894.529823] dw_hdmi_phy_gen2_txpwron
[ 3894.533567] dw-hdmi-jz4780 10180000.hdmi: PHY powered down in 0 =
iterations
[ 3894.540496] dw_hdmi_phy_gen2_pddq
[ 3894.543966] dw_hdmi_phy_update_hpd
[ 3894.547435] dw-hdmi-jz4780 10180000.hdmi: EVENT=3Dplugout
[ 3897.079560] dw_hdmi_update_power
[ 3897.082840] dw_hdmi_update_power: hdmi->force=3D0
[ 3897.087394] dw_hdmi_update_power: hdmi->disabled=3D0
[ 3897.092207] dw_hdmi_update_power: hdmi->bridge_is_on=3D0
[ 3897.097370] dw_hdmi_update_power: hdmi->rxsense=3D1
[ 3897.102316] dw_hdmi_update_power: force=3D2
[ 3897.106380] dw_hdmi_update_power: hdmi->bridge_is_on=3D0
[ 3897.111667] dw_hdmi_poweron
[ 3897.114518] dw_hdmi_setup
[ 3897.117163] hdmi_disable_overflow_interrupts
[ 3897.121478] dw-hdmi-jz4780 10180000.hdmi: Non-CEA mode used in HDMI
[ 3897.127930] hdmi_av_composer
[ 3897.130848] dw-hdmi-jz4780 10180000.hdmi: final pixclk =3D 0
[ 3897.136506] dw_hdmi_phy_init
[ 3897.139440] dw_hdmi_phy_sel_data_en_pol
[ 3897.143428] dw_hdmi_phy_sel_interface_control
[ 3897.147840] hdmi_phy_configure
[ 3897.150922] dw_hdmi_phy_power_off
[ 3897.154415] dw_hdmi_phy_gen2_txpwron
[ 3897.158043] dw-hdmi-jz4780 10180000.hdmi: PHY powered down in 0 =
iterations
[ 3897.165094] dw_hdmi_phy_gen2_pddq
[ 3897.168468] dw_hdmi_set_high_tmds_clock_ratio
[ 3897.173002] hdmi_phy_configure_dwc_hdmi_3d_tx
[ 3897.186578] dw_hdmi_phy_power_on
[ 3897.189847] dw_hdmi_phy_gen2_txpwron
[ 3897.193586] dw_hdmi_phy_gen2_pddq
[ 3897.217640] dw-hdmi-jz4780 10180000.hdmi: PHY PLL locked 1 iterations
[ 3897.224226] dw_hdmi_phy_sel_data_en_pol
[ 3897.228107] dw_hdmi_phy_sel_interface_control
[ 3897.232631] hdmi_phy_configure
[ 3897.235739] dw_hdmi_phy_power_off
[ 3897.239082] dw_hdmi_phy_gen2_txpwron
[ 3897.242826] dw-hdmi-jz4780 10180000.hdmi: PHY powered down in 0 =
iterations
[ 3897.249754] dw_hdmi_phy_gen2_pddq
[ 3897.253239] dw_hdmi_set_high_tmds_clock_ratio
[ 3897.257658] hdmi_phy_configure_dwc_hdmi_3d_tx
[ 3897.271264] dw_hdmi_phy_power_on
[ 3897.274659] dw_hdmi_phy_gen2_txpwron
[ 3897.278292] dw_hdmi_phy_gen2_pddq
[ 3897.283840] dw-hdmi-jz4780 10180000.hdmi: PHY PLL locked 1 iterations
[ 3897.290346] dw_hdmi_enable_video_path
[ 3897.294240] dw-hdmi-jz4780 10180000.hdmi: sink has audio support
[ 3897.300324] dw-hdmi-jz4780 10180000.hdmi: dw_hdmi_setup HDMI mode
[ 3897.306596] hdmi_config_AVI
[ 3897.309467] hdmi_config_vendor_specific_infoframe
[ 3897.314336] hdmi_config_drm_infoframe
[ 3897.318096] hdmi_tx_hdcp_config
[ 3897.321270] dw_hdmi_clear_overflow
[ 3897.324831] dw_hdmi_phy_update_hpd
[ 3897.328298] dw-hdmi-jz4780 10180000.hdmi: EVENT=3Dplugin
[ 3897.333704] dw_hdmi_update_power
[ 3897.336990] dw_hdmi_update_power: hdmi->force=3D0
[ 3897.341551] dw_hdmi_update_power: hdmi->disabled=3D0
[ 3897.346528] dw_hdmi_update_power: hdmi->bridge_is_on=3D1
[ 3897.351858] dw_hdmi_update_power: hdmi->rxsense=3D1
[ 3897.356615] dw_hdmi_update_power: force=3D2
[ 3897.360655] dw_hdmi_update_power: hdmi->bridge_is_on=3D1
[ 3897.365980] dw_hdmi_phy_update_hpd

So the plugout/plugin events are not processed further.

One thing looks strange:

[ 3897.127930] hdmi_av_composer
[ 3897.130848] dw-hdmi-jz4780 10180000.hdmi: final pixclk =3D 0

But I have no idea if this is the reason or the consequence
of the uninitialized lcdc.

So we need some DRM specialist to take a look on it.

BR and thanks,
Nikolaus

