Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 26CF720C592
	for <lists+linux-mips@lfdr.de>; Sun, 28 Jun 2020 05:28:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725909AbgF1D17 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 27 Jun 2020 23:27:59 -0400
Received: from mail.loongson.cn ([114.242.206.163]:43746 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725897AbgF1D17 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sat, 27 Jun 2020 23:27:59 -0400
Received: from [10.130.0.52] (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxr94yDvheNnJLAA--.3271S3;
        Sun, 28 Jun 2020 11:27:47 +0800 (CST)
Subject: Re: [1/7] irqchip: Fix potential resource leaks
To:     Markus Elfring <Markus.Elfring@web.de>, devicetree@vger.kernel.org,
        linux-mips@vger.kernel.org
References: <65e734f7-c43c-f96b-3650-980e15edba60@web.de>
 <d2111f53-ca52-fedf-0257-71f0aa89b093@loongson.cn>
 <9ca22645-8bf3-008f-fe55-d432f962cac3@web.de>
 <bd28aef9-ba70-0539-bdc3-6ce7162cefca@loongson.cn>
 <cc6b95ec-691e-f010-4a04-add39d706c4b@web.de>
 <423f83e0-c533-c346-ab8b-f2c6ccc828a2@loongson.cn>
 <37ff7ca4-dc7c-6a43-94a3-9628efe69b25@web.de>
 <8556e402-52ae-849f-2f6e-e56406057dce@loongson.cn>
 <c425c66a-d2fc-dad2-dc98-31659342a5fb@web.de>
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
        Huacai Chen <chenhc@lemote.com>,
        Jason Cooper <jason@lakedaemon.net>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Marc Zyngier <maz@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Xuefeng Li <lixuefeng@loongson.cn>
From:   Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <61c969d7-8647-56c1-8123-9b000036ae66@loongson.cn>
Date:   Sun, 28 Jun 2020 11:27:46 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <c425c66a-d2fc-dad2-dc98-31659342a5fb@web.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: AQAAf9Dxr94yDvheNnJLAA--.3271S3
X-Coremail-Antispam: 1UD129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
        VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUUYX7AC8VAFwI0_Gr0_Xr1l1xkIjI8I6I8E
        6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28Cjx
        kF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8I
        cVCY1x0267AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z2
        80aVCY1x0267AKxVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
        64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y6r17McIj6I8E87Iv67AKxVW8JVWxJw
        Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7
        M4IIrI8v6xkF7I0E8cxan2IY04v7Mxk0xIA0c2IEe2xFo4CEbIxvr21lc2xSY4AK67AK6r
        48MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_
        Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x
        0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8
        JVWxJwCI42IY6xAIw20EY4v20xvaj40_Zr0_Wr1UMIIF0xvEx4A2jsIE14v26r1j6r4UMI
        IF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUco7NUUUUU
        =
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 06/24/2020 08:08 PM, Markus Elfring wrote:
>>> How do you think about to extend source code analysis tools accordingly?
>> I have no good idea,
>> maybe some simple match check tools can do this.
> Would you like to help with any additional software development resources
> (besides your current contribution)?

I am glad to do it in my spare time.

>
> Have you heard anything according to recent research (from computer science)
> for this application domain?

No.

>
> Regards,
> Markus

