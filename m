Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B6EC33B260D
	for <lists+linux-mips@lfdr.de>; Thu, 24 Jun 2021 06:11:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229448AbhFXENS convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-mips@lfdr.de>); Thu, 24 Jun 2021 00:13:18 -0400
Received: from out28-219.mail.aliyun.com ([115.124.28.219]:35558 "EHLO
        out28-219.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229379AbhFXENS (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 24 Jun 2021 00:13:18 -0400
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.08217759|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.0126925-0.000244556-0.987063;FP=0|0|0|0|0|-1|-1|-1;HT=ay29a033018047203;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=12;RT=12;SR=0;TI=SMTPD_---.KX7ZxPK_1624507847;
Received: from zhouyanjie-virtual-machine(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.KX7ZxPK_1624507847)
          by smtp.aliyun-inc.com(10.147.41.138);
          Thu, 24 Jun 2021 12:10:48 +0800
Date:   Thu, 24 Jun 2021 12:10:46 +0800
From:   =?UTF-8?B?5ZGo55Cw5p2w?= <zhouyanjie@wanyeetech.com>
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     tsbogend@alpha.franken.de, robh+dt@kernel.org,
        linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dongsheng.qiu@ingenic.com,
        aric.pzqi@ingenic.com, rick.tyliu@ingenic.com,
        sihui.liu@ingenic.com, jun.jiang@ingenic.com,
        sernia.zhou@foxmail.com
Subject: Re: [PATCH v2 2/3] MIPS: Ingenic: Add MAC syscon nodes for Ingenic
 SoCs.
Message-ID: <20210624121046.4e1f73e1@zhouyanjie-virtual-machine>
In-Reply-To: <3L36VQ.1XFKT5OGBXT2@crapouillou.net>
References: <1624377338-75384-1-git-send-email-zhouyanjie@wanyeetech.com>
        <1624377338-75384-3-git-send-email-zhouyanjie@wanyeetech.com>
        <3L36VQ.1XFKT5OGBXT2@crapouillou.net>
X-Mailer: Claws Mail 3.14.1 (GTK+ 2.24.30; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Paul,

于 Wed, 23 Jun 2021 19:34:15 +0100
Paul Cercueil <paul@crapouillou.net> 写道:

> Hi Zhou,
> 
> Le mar., juin 22 2021 at 23:55:37 +0800, 周琰杰 (Zhou Yanjie) 
> <zhouyanjie@wanyeetech.com> a écrit :
> > Add MAC syscon nodes for X1000 SoC and X1830 SoC from Ingenic.
> > 
> > Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
> > Acked-by: Paul Cercueil <paul@crapouillou.net>
> > ---
> > 
> > Notes:
> >     v1->v2:
> >     No change.
> > 
> >  arch/mips/boot/dts/ingenic/x1000.dtsi | 7 +++++++
> >  arch/mips/boot/dts/ingenic/x1830.dtsi | 7 +++++++
> >  2 files changed, 14 insertions(+)
> > 
> > diff --git a/arch/mips/boot/dts/ingenic/x1000.dtsi 
> > b/arch/mips/boot/dts/ingenic/x1000.dtsi
> > index aac9ded..dec7909 100644
> > --- a/arch/mips/boot/dts/ingenic/x1000.dtsi
> > +++ b/arch/mips/boot/dts/ingenic/x1000.dtsi
> > @@ -80,6 +80,11 @@
> > 
> >  			status = "disabled";
> >  		};
> > +
> > +		mac_phy_ctrl: mac-phy-ctrl@e8 {
> > +			compatible = "syscon";
> > +			reg = <0xe8 0x4>;
> > +		};  
> 
> I acked this patch already, but you do need to update the CGU binding 
> documentation as well.

Sure, I will send v3.

> 
> -Paul
> 
> >  	};
> > 
> >  	ost: timer@12000000 {
> > @@ -347,6 +352,8 @@
> >  		clocks = <&cgu X1000_CLK_MAC>;
> >  		clock-names = "stmmaceth";
> > 
> > +		mode-reg = <&mac_phy_ctrl>;
> > +
> >  		status = "disabled";
> > 
> >  		mdio: mdio {
> > diff --git a/arch/mips/boot/dts/ingenic/x1830.dtsi 
> > b/arch/mips/boot/dts/ingenic/x1830.dtsi
> > index 59ca3a8..215257f 100644
> > --- a/arch/mips/boot/dts/ingenic/x1830.dtsi
> > +++ b/arch/mips/boot/dts/ingenic/x1830.dtsi
> > @@ -73,6 +73,11 @@
> > 
> >  			status = "disabled";
> >  		};
> > +
> > +		mac_phy_ctrl: mac-phy-ctrl@e8 {
> > +			compatible = "syscon";
> > +			reg = <0xe8 0x4>;
> > +		};
> >  	};
> > 
> >  	ost: timer@12000000 {
> > @@ -336,6 +341,8 @@
> >  		clocks = <&cgu X1830_CLK_MAC>;
> >  		clock-names = "stmmaceth";
> > 
> > +		mode-reg = <&mac_phy_ctrl>;
> > +
> >  		status = "disabled";
> > 
> >  		mdio: mdio {
> > --
> > 2.7.4
> >   
> 

