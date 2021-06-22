Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC0003B07A6
	for <lists+linux-mips@lfdr.de>; Tue, 22 Jun 2021 16:41:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231971AbhFVOoF convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-mips@lfdr.de>); Tue, 22 Jun 2021 10:44:05 -0400
Received: from out28-75.mail.aliyun.com ([115.124.28.75]:56975 "EHLO
        out28-75.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230510AbhFVOoE (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 22 Jun 2021 10:44:04 -0400
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.07639962|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_regular_dialog|0.203167-0.00545665-0.791376;FP=0|0|0|0|0|-1|-1|-1;HT=ay29a033018047199;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=12;RT=12;SR=0;TI=SMTPD_---.KWJToea_1624372904;
Received: from zhouyanjie-virtual-machine(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.KWJToea_1624372904)
          by smtp.aliyun-inc.com(10.147.44.129);
          Tue, 22 Jun 2021 22:41:45 +0800
Date:   Tue, 22 Jun 2021 22:41:43 +0800
From:   =?UTF-8?B?5ZGo55Cw5p2w?= <zhouyanjie@wanyeetech.com>
To:     Paul Cercueil <paul@opendingux.net>
Cc:     tsbogend@alpha.franken.de, robh+dt@kernel.org,
        linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dongsheng.qiu@ingenic.com,
        aric.pzqi@ingenic.com, rick.tyliu@ingenic.com,
        sihui.liu@ingenic.com, jun.jiang@ingenic.com,
        sernia.zhou@foxmail.com
Subject: Re: [PATCH 3/4] MIPS: GCW0: Adjust pinctrl related code in device
 tree.
Message-ID: <20210622224143.72d063dc@zhouyanjie-virtual-machine>
In-Reply-To: <1HW3VQ.OQVPDYR5D5RR1@opendingux.net>
References: <1624347445-88070-1-git-send-email-zhouyanjie@wanyeetech.com>
        <1624347445-88070-4-git-send-email-zhouyanjie@wanyeetech.com>
        <9US3VQ.SK89X0OFZC2Z2@opendingux.net>
        <20210622215119.18a49cf9@zhouyanjie-virtual-machine>
        <1HW3VQ.OQVPDYR5D5RR1@opendingux.net>
X-Mailer: Claws Mail 3.14.1 (GTK+ 2.24.30; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Paul,

于 Tue, 22 Jun 2021 15:05:25 +0100
Paul Cercueil <paul@opendingux.net> 写道:

> Hi Zhou,
> 
> Le mar., juin 22 2021 at 21:51:19 +0800, 周琰杰 
> <zhouyanjie@wanyeetech.com> a écrit :
> > Hi Paul,
> > 
> > 于 Tue, 22 Jun 2021 13:46:57 +0100
> > Paul Cercueil <paul@opendingux.net> 写道:
> >   
> >>  Hi Zhou,
> >> 
> >>  Le mar., juin 22 2021 at 15:37:24 +0800, 周琰杰 (Zhou Yanjie)
> >>  <zhouyanjie@wanyeetech.com> a écrit :  
> >>  > Change the "lcd-24bit" in the pinctrl groups to "lcd-8bit",
> >>  > "lcd-16bit", "lcd-18bit", "lcd-24bit", since the pinctrl
> >>  > driver has done the necessary splitting of the lcd group,
> >>  > and it is convenient to further streamline the lcd-24bit
> >>  > group in the subsequent pinctrl driver.
> >>  >
> >>  > Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
> >>  > ---
> >>  >  arch/mips/boot/dts/ingenic/gcw0.dts | 2 +-
> >>  >  1 file changed, 1 insertion(+), 1 deletion(-)
> >>  >
> >>  > diff --git a/arch/mips/boot/dts/ingenic/gcw0.dts
> >>  > b/arch/mips/boot/dts/ingenic/gcw0.dts
> >>  > index f4c04f2..dec3ba6f 100644
> >>  > --- a/arch/mips/boot/dts/ingenic/gcw0.dts
> >>  > +++ b/arch/mips/boot/dts/ingenic/gcw0.dts
> >>  > @@ -393,7 +393,7 @@
> >>  >  &pinctrl {
> >>  >  	pins_lcd: lcd {
> >>  >  		function = "lcd";
> >>  > -		groups = "lcd-24bit";
> >>  > +		groups = "lcd-8bit", "lcd-16bit", "lcd-18bit",
> >>  > "lcd-24bit";  
> >> 
> >>  No, I'm pretty sure this won't work, since "lcd-24bit" contains
> >> pins that are also contained by the other groups.
> >>   
> > 
> > Sure, it seems that we should modify the pinctrl first, then modify 
> > the
> > dts, and then put them in the same series, so as to ensure that
> > they do
> > not cause damage.  
> 
> No, the "lcd-24bit" group is ABI now. We can't change it...
> 

Sure.

Thanks and best regards!

> -Paul
> 
> > 
> > Thanks and best regards!
> >   
> >>  -Paul
> >>   
> >>  >  	};
> >>  >
> >>  >  	pins_uart2: uart2 {
> >>  > --
> >>  > 2.7.4
> >>  >  
> >>   
> >   
> 

