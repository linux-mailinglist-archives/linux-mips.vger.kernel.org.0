Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 437513B5875
	for <lists+linux-mips@lfdr.de>; Mon, 28 Jun 2021 06:47:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232009AbhF1Et3 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-mips@lfdr.de>); Mon, 28 Jun 2021 00:49:29 -0400
Received: from out28-121.mail.aliyun.com ([115.124.28.121]:42793 "EHLO
        out28-121.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229578AbhF1Et2 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 28 Jun 2021 00:49:28 -0400
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.1227538|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_news_journal|0.00527116-0.00049097-0.994238;FP=0|0|0|0|0|-1|-1|-1;HT=ay29a033018047208;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=15;RT=15;SR=0;TI=SMTPD_---.KZ3-RCe_1624855620;
Received: from zhouyanjie-virtual-machine(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.KZ3-RCe_1624855620)
          by smtp.aliyun-inc.com(10.147.44.118);
          Mon, 28 Jun 2021 12:47:01 +0800
Date:   Mon, 28 Jun 2021 12:46:57 +0800
From:   =?UTF-8?B?5ZGo55Cw5p2w?= <zhouyanjie@wanyeetech.com>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     mturquette@baylibre.com, paul@crapouillou.net, robh+dt@kernel.org,
        tsbogend@alpha.franken.de, linux-mips@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, dongsheng.qiu@ingenic.com,
        aric.pzqi@ingenic.com, rick.tyliu@ingenic.com,
        sihui.liu@ingenic.com, jun.jiang@ingenic.com,
        sernia.zhou@foxmail.com
Subject: Re: [PATCH v4 2/5] dt-bindings: clock: Add documentation for MAC
 PHY control bindings.
Message-ID: <20210628124657.4a586b03@zhouyanjie-virtual-machine>
In-Reply-To: <162484872210.2516444.13185593951785977784@swboyd.mtv.corp.google.com>
References: <1624688321-69131-1-git-send-email-zhouyanjie@wanyeetech.com>
        <1624688321-69131-3-git-send-email-zhouyanjie@wanyeetech.com>
        <162484872210.2516444.13185593951785977784@swboyd.mtv.corp.google.com>
X-Mailer: Claws Mail 3.14.1 (GTK+ 2.24.30; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Stephen,

于 Sun, 27 Jun 2021 19:52:02 -0700
Stephen Boyd <sboyd@kernel.org> 写道:

> Quoting 周琰杰 (Zhou Yanjie) (2021-06-25 23:18:38)
> > Update the CGU binding documentation, add mac-phy-ctrl as a
> > pattern property.
> > 
> > Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
> > Acked-by: Paul Cercueil <paul@crapouillou.net>
> > ---  
> 
> Acked-by: Stephen Boyd <sboyd@kernel.org>
> 

Thanks!

> Would also be good to add it to the example.

Unfortunately, mac-phy-ctrl only appeared after JZ4775 (include JZ4775),
but now the CGU driver of JZ4775 has not been merged into the mainline.
My plan is to wait for the CGU driver of JZ4775 to be merged into the
mainline and then add a new example based on JZ4775 :)

Thanks and best regards!
