Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2739213AB6A
	for <lists+linux-mips@lfdr.de>; Tue, 14 Jan 2020 14:48:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726197AbgANNsv (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 14 Jan 2020 08:48:51 -0500
Received: from out28-121.mail.aliyun.com ([115.124.28.121]:44626 "EHLO
        out28-121.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726133AbgANNsv (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 14 Jan 2020 08:48:51 -0500
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.4116705|-1;CH=green;DM=CONTINUE|CONTINUE|true|0.0462401-0.00185986-0.9519;DS=CONTINUE|ham_enroll_verification|0.0103876-0.00146899-0.988143;FP=0|0|0|0|0|-1|-1|-1;HT=e02c03268;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=25;RT=25;SR=0;TI=SMTPD_---.GbzNf-h_1579009702;
Received: from 192.168.10.218(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.GbzNf-h_1579009702)
          by smtp.aliyun-inc.com(10.147.40.7);
          Tue, 14 Jan 2020 21:48:24 +0800
Subject: Re: [PATCH 3/6] dt-bindings: MIPS: Document Ingenic SoCs binding.
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
References: <Introduce SMP support for CI20 (based on JZ4780).>
 <1578933813-80122-1-git-send-email-zhouyanjie@wanyeetech.com>
 <1578933813-80122-5-git-send-email-zhouyanjie@wanyeetech.com>
 <30183031578977983@vla1-0bfbe4c1c324.qloud-c.yandex.net>
Cc:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "paul.burton@mips.com" <paul.burton@mips.com>,
        "paulburton@kernel.org" <paulburton@kernel.org>,
        "jhogan@kernel.org" <jhogan@kernel.org>,
        "miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "syq@debian.org" <syq@debian.org>,
        "ralf@linux-mips.org" <ralf@linux-mips.org>,
        "tglx@linutronix.de" <tglx@linutronix.de>,
        "jason@lakedaemon.net" <jason@lakedaemon.net>,
        "maz@kernel.org" <maz@kernel.org>,
        "chenhc@lemote.com" <chenhc@lemote.com>,
        "daniel.lezcano@linaro.org" <daniel.lezcano@linaro.org>,
        "ebiederm@xmission.com" <ebiederm@xmission.com>,
        "keescook@chromium.org" <keescook@chromium.org>,
        "ak@linux.intel.com" <ak@linux.intel.com>,
        "krzk@kernel.org" <krzk@kernel.org>,
        "paul@crapouillou.net" <paul@crapouillou.net>,
        "prasannatsmkumar@gmail.com" <prasannatsmkumar@gmail.com>,
        "sernia.zhou@foxmail.com" <sernia.zhou@foxmail.com>,
        "zhenwenjin@gmail.com" <zhenwenjin@gmail.com>
From:   Zhou Yanjie <zhouyanjie@wanyeetech.com>
Message-ID: <5E1DC6A7.9070601@wanyeetech.com>
Date:   Tue, 14 Jan 2020 21:48:23 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
 Thunderbird/38.8.0
MIME-Version: 1.0
In-Reply-To: <30183031578977983@vla1-0bfbe4c1c324.qloud-c.yandex.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Jiaxun,

On 2020年01月14日 12:59, Jiaxun Yang wrote:
>
> 14.01.2020, 00:44, "周琰杰 (Zhou Yanjie)" <zhouyanjie@wanyeetech.com>:
>> Document the available properties for the SoC root node and the
>> CPU nodes of the devicetree for the Ingenic XBurst SoCs.
>>
>> Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
>> ---
>>   .../bindings/mips/ingenic/ingenic,cpu.txt | 32 ++++++++++++++++++++++
>>   .../bindings/mips/ingenic/ingenic,soc,txt | 18 ++++++++++++
>>   2 files changed, 50 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/mips/ingenic/ingenic,cpu.txt
>>   create mode 100644 Documentation/devicetree/bindings/mips/ingenic/ingenic,soc,txt
>>
> We'd better use schemas for the document.

I will change it in v2.

Thanks and best regards!

>
> See[1]
>
> Thanks.
>
> [1]: https://lwn.net/Articles/771621/
> --
> Jiaxun Yang

