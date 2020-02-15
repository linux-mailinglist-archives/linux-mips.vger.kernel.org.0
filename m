Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DF42715FF36
	for <lists+linux-mips@lfdr.de>; Sat, 15 Feb 2020 17:17:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726211AbgBOQRg (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 15 Feb 2020 11:17:36 -0500
Received: from out28-4.mail.aliyun.com ([115.124.28.4]:48048 "EHLO
        out28-4.mail.aliyun.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726137AbgBOQRg (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 15 Feb 2020 11:17:36 -0500
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.1699795|-1;CH=green;DM=CONTINUE|CONTINUE|true|0.0157863-0.000302482-0.983911;DS=CONTINUE|ham_social|0.0123951-0.000427235-0.987178;FP=0|0|0|0|0|-1|-1|-1;HT=e02c03295;MF=zhouyanjie@wanyeetech.com;NM=1;PH=DS;RN=28;RT=28;SR=0;TI=SMTPD_---.GoRZEMS_1581783435;
Received: from 192.168.10.227(mailfrom:zhouyanjie@wanyeetech.com fp:SMTPD_---.GoRZEMS_1581783435)
          by smtp.aliyun-inc.com(10.147.40.26);
          Sun, 16 Feb 2020 00:17:17 +0800
Subject: Re: [PATCH v4 1/6] MIPS: JZ4780: Introduce SMP support.
To:     afzal mohammed <afzal.mohd.ma@gmail.com>
References: <1581703360-112557-1-git-send-email-zhouyanjie@wanyeetech.com>
 <1581703360-112557-3-git-send-email-zhouyanjie@wanyeetech.com>
 <20200215150355.GA6253@afzalpc>
Cc:     linux-mips@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        paul@crapouillou.net, mturquette@baylibre.com, sboyd@kernel.org,
        robh+dt@kernel.org, mark.rutland@arm.com, ralf@linux-mips.org,
        paulburton@kernel.org, jiaxun.yang@flygoat.com, chenhc@lemote.com,
        allison@lohutok.net, tglx@linutronix.de, daniel.lezcano@linaro.org,
        geert+renesas@glider.be, krzk@kernel.org, keescook@chromium.org,
        ebiederm@xmission.com, miquel.raynal@bootlin.com,
        paul@boddie.org.uk, hns@goldelico.com, sernia.zhou@foxmail.com,
        zhenwenjin@gmail.com, mips-creator-ci20-dev@googlegroups.com,
        1326991897@qq.com
From:   Zhou Yanjie <zhouyanjie@wanyeetech.com>
Message-ID: <5E48198B.60806@wanyeetech.com>
Date:   Sun, 16 Feb 2020 00:17:15 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
 Thunderbird/38.8.0
MIME-Version: 1.0
In-Reply-To: <20200215150355.GA6253@afzalpc>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Afzal,

On 2020年02月15日 23:03, afzal mohammed wrote:
> Hi,
>
> On Sat, Feb 15, 2020 at 02:02:35AM +0800, 周琰杰 (Zhou Yanjie) wrote:
>
>> +	/* setup the mailbox IRQ */
>> +	setup_irq(MIPS_CPU_IRQ_BASE + 3, &mbox_action);
> s/setup_irq/request_irq, see,
>
> https://lkml.kernel.org/r/alpine.DEB.2.20.1710191609480.1971@nanos
> https://lkml.kernel.org/r/cover.1581478323.git.afzal.mohd.ma@gmail.com

Thanks for your advice, will change in v5.

>
> Regards
> afzal

Thanks and best regards!
