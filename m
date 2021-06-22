Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8B42A3B0633
	for <lists+linux-mips@lfdr.de>; Tue, 22 Jun 2021 15:51:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230102AbhFVNxm convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-mips@lfdr.de>); Tue, 22 Jun 2021 09:53:42 -0400
Received: from out28-101.mail.aliyun.com ([115.124.28.101]:56882 "EHLO
        out28-101.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229907AbhFVNxl (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 22 Jun 2021 09:53:41 -0400
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.08888309|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_regular_dialog|0.0726204-0.00257395-0.924806;FP=0|0|0|0|0|-1|-1|-1;HT=ay29a033018047188;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=12;RT=12;SR=0;TI=SMTPD_---.KWIJ6dl_1624369880;
Received: from zhouyanjie-virtual-machine(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.KWIJ6dl_1624369880)
          by smtp.aliyun-inc.com(10.147.41.158);
          Tue, 22 Jun 2021 21:51:21 +0800
Date:   Tue, 22 Jun 2021 21:51:19 +0800
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
Message-ID: <20210622215119.18a49cf9@zhouyanjie-virtual-machine>
In-Reply-To: <9US3VQ.SK89X0OFZC2Z2@opendingux.net>
References: <1624347445-88070-1-git-send-email-zhouyanjie@wanyeetech.com>
        <1624347445-88070-4-git-send-email-zhouyanjie@wanyeetech.com>
        <9US3VQ.SK89X0OFZC2Z2@opendingux.net>
X-Mailer: Claws Mail 3.14.1 (GTK+ 2.24.30; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Paul,

于 Tue, 22 Jun 2021 13:46:57 +0100
Paul Cercueil <paul@opendingux.net> 写道:

> Hi Zhou,
> 
> Le mar., juin 22 2021 at 15:37:24 +0800, 周琰杰 (Zhou Yanjie) 
> <zhouyanjie@wanyeetech.com> a écrit :
> > Change the "lcd-24bit" in the pinctrl groups to "lcd-8bit",
> > "lcd-16bit", "lcd-18bit", "lcd-24bit", since the pinctrl
> > driver has done the necessary splitting of the lcd group,
> > and it is convenient to further streamline the lcd-24bit
> > group in the subsequent pinctrl driver.
> > 
> > Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
> > ---
> >  arch/mips/boot/dts/ingenic/gcw0.dts | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/arch/mips/boot/dts/ingenic/gcw0.dts 
> > b/arch/mips/boot/dts/ingenic/gcw0.dts
> > index f4c04f2..dec3ba6f 100644
> > --- a/arch/mips/boot/dts/ingenic/gcw0.dts
> > +++ b/arch/mips/boot/dts/ingenic/gcw0.dts
> > @@ -393,7 +393,7 @@
> >  &pinctrl {
> >  	pins_lcd: lcd {
> >  		function = "lcd";
> > -		groups = "lcd-24bit";
> > +		groups = "lcd-8bit", "lcd-16bit", "lcd-18bit",
> > "lcd-24bit";  
> 
> No, I'm pretty sure this won't work, since "lcd-24bit" contains pins 
> that are also contained by the other groups.
> 

Sure, it seems that we should modify the pinctrl first, then modify the
dts, and then put them in the same series, so as to ensure that they do
not cause damage.

Thanks and best regards!

> -Paul
> 
> >  	};
> > 
> >  	pins_uart2: uart2 {
> > --
> > 2.7.4
> >   
> 

