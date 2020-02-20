Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1A8B8165DC9
	for <lists+linux-mips@lfdr.de>; Thu, 20 Feb 2020 13:45:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728111AbgBTMpH (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 20 Feb 2020 07:45:07 -0500
Received: from out28-218.mail.aliyun.com ([115.124.28.218]:43039 "EHLO
        out28-218.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726885AbgBTMpG (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 20 Feb 2020 07:45:06 -0500
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.1386076|-1;CH=green;DM=CONTINUE|CONTINUE|true|0.196715-0.0112271-0.792058;DS=CONTINUE|ham_regular_dialog|0.189735-0.00256273-0.807702;FP=0|0|0|0|0|-1|-1|-1;HT=e02c03293;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=10;RT=10;SR=0;TI=SMTPD_---.Gq8NPLt_1582202431;
Received: from 192.168.10.227(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.Gq8NPLt_1582202431)
          by smtp.aliyun-inc.com(10.147.41.138);
          Thu, 20 Feb 2020 20:40:31 +0800
Subject: Re: [PATCH 2/2] MAINTAINERS: Set MIPS status to Odd Fixes
To:     YunQiang Su <wzssyqa@gmail.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
References: <20200219191730.1277800-1-paulburton@kernel.org>
 <20200219191730.1277800-3-paulburton@kernel.org>
 <20200220112330.GA3053@alpha.franken.de>
 <CAKcpw6UDik=K6MdEayDPVaZP+BsqrbKoKAXJaHLERrxDmFF7+A@mail.gmail.com>
Cc:     Paul Burton <paulburton@kernel.org>,
        linux-mips <linux-mips@vger.kernel.org>,
        linux-kernel@vger.kernel.org, wayne.sun@cipunited.com,
        chris.wang@neocore.cn, Yunqiang Su <ysu@wavecomp.com>,
        dongsheng.qiu@ingenic.com, xuwanhao@wanyeetech.com
From:   Zhou Yanjie <zhouyanjie@wanyeetech.com>
Message-ID: <5E4E7E3E.6070608@wanyeetech.com>
Date:   Thu, 20 Feb 2020 20:40:30 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
 Thunderbird/38.8.0
MIME-Version: 1.0
In-Reply-To: <CAKcpw6UDik=K6MdEayDPVaZP+BsqrbKoKAXJaHLERrxDmFF7+A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi,

CC people from Ingenic Semi and Wanyee Tech.

On 2020年02月20日 20:11, YunQiang Su wrote:
> CC people from NeoCore and CIP United, and my Wave Computing's mail address.
>
> Thomas Bogendoerfer <tsbogend@alpha.franken.de> 于2020年2月20日周四 下午7:23写道：
>> On Wed, Feb 19, 2020 at 11:17:30AM -0800, Paul Burton wrote:
>>> My time with MIPS the company has reached its end, and so at best I'll
>>> have little time spend on maintaining arch/mips/. Reflect that in
>>> MAINTAINERS by changing status to Odd Fixes. Hopefully this might spur
>>> the involvement of someone with more time, but even if not it should
>>> help serve to avoid unrealistic expectations.
>> I'd like to jump in as MIPS maintainer. I'm doing Linux MIPS kernel
> It is a great news that you are willing to act as maintainer as Linux-MIPS.
>
>> development since ages (started with an Olivetti M700 and kernel version
>> 2.x) and right now time for doing the jobs isn't issue:-)
>>
> I noticed that you are mainly working some old machines.
> And recently years, there are some new machines from Ingenic, Loongson, MTK etc.
> MIPS Inc also have some MIPSr6 IPs.
> I think that you need some of these machines.

I can provide some new Ingenic platform machines as a gift to Thomas.
Ingenic X1000 can be provided in a short time, it has been directly 
supported by kernel 5.6.
X1830 and X2000 will be available later.

> In the last years, we see that the single maintainer is not enough as people may
> quite busy.
> Do you think that we need co-maintainers?
>
>> Thomas.
>>
>> --
>> Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
>> good idea.                                                [ RFC1925, 2.3 ]
>
>

