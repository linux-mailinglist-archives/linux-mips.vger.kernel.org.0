Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8968B282DC0
	for <lists+linux-mips@lfdr.de>; Sun,  4 Oct 2020 23:26:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726345AbgJDV0L (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 4 Oct 2020 17:26:11 -0400
Received: from out28-77.mail.aliyun.com ([115.124.28.77]:34868 "EHLO
        out28-77.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726313AbgJDV0L (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 4 Oct 2020 17:26:11 -0400
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.1129661|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_social|0.00855663-0.000426929-0.991016;FP=0|0|0|0|0|-1|-1|-1;HT=ay29a033018047193;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=3;RT=3;SR=0;TI=SMTPD_---.IfSdSrU_1601846768;
Received: from 192.168.10.195(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.IfSdSrU_1601846768)
          by smtp.aliyun-inc.com(10.147.40.233);
          Mon, 05 Oct 2020 05:26:09 +0800
Subject: Re: Kernel 5.9-rc regression.
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     "open list:MIPS" <linux-mips@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
References: <25b6a64b-b5ac-c85a-abde-909fb2d768f9@wanyeetech.com>
 <20201001215548.GA21328@alpha.franken.de>
From:   Zhou Yanjie <zhouyanjie@wanyeetech.com>
Message-ID: <42898d8c-e95a-bc07-3e6e-0ead4bc9e17d@wanyeetech.com>
Date:   Mon, 5 Oct 2020 05:26:07 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.3.0
MIME-Version: 1.0
In-Reply-To: <20201001215548.GA21328@alpha.franken.de>
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org


ÔÚ 2020/10/2 ÉÏÎç5:55, Thomas Bogendoerfer Ð´µÀ:
> On Fri, Oct 02, 2020 at 04:15:43AM +0800, Zhou Yanjie wrote:
>> Hi Thomas and list,
>>
>> There is a strange phenomenon in kernel 5.9-rc: when using kernel 5.9-rc
>> with debian 10 and running htop, the memory footprint will be displayed as
>> 3.99T. When the actual memory footprint increases, the displayed value will
>> be reduced to 3.98T, 3.97T etc. These phenomena have been confirmed in
>> X1000, X1830, and JZ4780 (disable SMP), this phenomenon does not seem to
>> affect the SMP processor. When the JZ4780 turn on SMP, the memory footprint
>> will be displayed normally.
> try this fix
>
> https://lore.kernel.org/lkml/20201001203931.GD2706729@carbon.DHCP.thefacebook.com/


It works, thanks!


> Thomas.
>
