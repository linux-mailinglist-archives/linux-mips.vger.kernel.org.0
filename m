Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 84573166503
	for <lists+linux-mips@lfdr.de>; Thu, 20 Feb 2020 18:36:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728685AbgBTRgn (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 20 Feb 2020 12:36:43 -0500
Received: from out28-221.mail.aliyun.com ([115.124.28.221]:38981 "EHLO
        out28-221.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728434AbgBTRgn (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 20 Feb 2020 12:36:43 -0500
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.09792221|-1;CH=green;DM=CONTINUE|CONTINUE|true|0.465299-0.0134901-0.52121;DS=CONTINUE|ham_regular_dialog|0.646497-0.00514645-0.348356;FP=0|0|0|0|0|-1|-1|-1;HT=e01a16370;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=10;RT=10;SR=0;TI=SMTPD_---.GqCzg-L_1582220198;
Received: from 192.168.10.227(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.GqCzg-L_1582220198)
          by smtp.aliyun-inc.com(10.147.41.137);
          Fri, 21 Feb 2020 01:36:39 +0800
Subject: Re: [PATCH 2/2] MAINTAINERS: Set MIPS status to Odd Fixes
To:     YunQiang Su <wzssyqa@gmail.com>
References: <20200219191730.1277800-1-paulburton@kernel.org>
 <20200219191730.1277800-3-paulburton@kernel.org>
 <20200220112330.GA3053@alpha.franken.de>
 <CAKcpw6UDik=K6MdEayDPVaZP+BsqrbKoKAXJaHLERrxDmFF7+A@mail.gmail.com>
 <5E4E7E3E.6070608@wanyeetech.com>
 <CAKcpw6V-=bFG7O8a0SKbiAzQeHGzzaQD=8ZqVUhm8-B3PTA5xQ@mail.gmail.com>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Paul Burton <paulburton@kernel.org>,
        linux-mips <linux-mips@vger.kernel.org>,
        linux-kernel@vger.kernel.org, wayne.sun@cipunited.com,
        chris.wang@neocore.cn, Yunqiang Su <ysu@wavecomp.com>,
        dongsheng.qiu@ingenic.com, xuwanhao@wanyeetech.com
From:   Zhou Yanjie <zhouyanjie@wanyeetech.com>
Message-ID: <5E4EC3A6.3020802@wanyeetech.com>
Date:   Fri, 21 Feb 2020 01:36:38 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
 Thunderbird/38.8.0
MIME-Version: 1.0
In-Reply-To: <CAKcpw6V-=bFG7O8a0SKbiAzQeHGzzaQD=8ZqVUhm8-B3PTA5xQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi,

On 2020年02月21日 01:01, YunQiang Su wrote:
> Zhou Yanjie <zhouyanjie@wanyeetech.com> 于2020年2月20日周四 下午8:40写道：
>> Hi,
>>
>> CC people from Ingenic Semi and Wanyee Tech.
>>
>> On 2020年02月20日 20:11, YunQiang Su wrote:
>>> CC people from NeoCore and CIP United, and my Wave Computing's mail address.
>>>
>>> Thomas Bogendoerfer <tsbogend@alpha.franken.de> 于2020年2月20日周四 下午7:23写道：
>>>> On Wed, Feb 19, 2020 at 11:17:30AM -0800, Paul Burton wrote:
>>>>> My time with MIPS the company has reached its end, and so at best I'll
>>>>> have little time spend on maintaining arch/mips/. Reflect that in
>>>>> MAINTAINERS by changing status to Odd Fixes. Hopefully this might spur
>>>>> the involvement of someone with more time, but even if not it should
>>>>> help serve to avoid unrealistic expectations.
>>>> I'd like to jump in as MIPS maintainer. I'm doing Linux MIPS kernel
>>> It is a great news that you are willing to act as maintainer as Linux-MIPS.
>>>
>>>> development since ages (started with an Olivetti M700 and kernel version
>>>> 2.x) and right now time for doing the jobs isn't issue:-)
>>>>
>>> I noticed that you are mainly working some old machines.
>>> And recently years, there are some new machines from Ingenic, Loongson, MTK etc.
>>> MIPS Inc also have some MIPSr6 IPs.
>>> I think that you need some of these machines.
>> I can provide some new Ingenic platform machines as a gift to Thomas.
>> Ingenic X1000 can be provided in a short time, it has been directly
>> supported by kernel 5.6.
>> X1830 and X2000 will be available later.
>>
>>> In the last years, we see that the single maintainer is not enough as people may
>>> quite busy.
>>> Do you think that we need co-maintainers?
> Paul Cercueil also has interest about it. That's so cool.
>
> As a suggestion, I think that we can have a maintainers team:
>
> Option1: Paul Cercueil/Thomas Bogendoerfer/Jiaxun Yang
> Option2: Thomas Bogendoerfer/Paul Cercueil/Jiaxun Yang
>
> any idea?
>
> background:
> 1. PaulC works lots for Ingenic support.
> 2. Thomas works lots for some SGI IP and some other hardware
> 3. Jiaxun works lots for Loongson hardware.
>

How about the three maintainer have equal rights but different emphasis.
They can jointly maintain the common code parts, and they all have the 
veto power
to ensure that new changes will not affect other platforms. And they can 
have a
greater say in their respective focus departments, because each 
maintainer has
corresponding hardware in hand, which can ensure that the code is tested 
and
can run correctly.

BTW, as a developer of the Ingenic platform, I can donate the hardware 
of the
Ingenic platform to the other two maintainers so that any one of the 
three maintainer
can effectively verify the code of the Ingenic platform.

>
>>>> Thomas.
>>>>
>>>> --
>>>> Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
>>>> good idea.                                                [ RFC1925, 2.3 ]
>>>
>

