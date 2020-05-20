Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 130751DA989
	for <lists+linux-mips@lfdr.de>; Wed, 20 May 2020 06:58:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726435AbgETE6K (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 20 May 2020 00:58:10 -0400
Received: from mail.loongson.cn ([114.242.206.163]:59280 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726439AbgETE6K (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 20 May 2020 00:58:10 -0400
Received: from [10.130.0.52] (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxP2rWuMReudY2AA--.67S3;
        Wed, 20 May 2020 12:58:00 +0800 (CST)
Subject: Re: [PATCH] MIPS: SGI-IP27: Remove duplicated include in ip27-timer.c
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
References: <1589891291-7030-1-git-send-email-yangtiezhu@loongson.cn>
 <20200519160334.GA16307@alpha.franken.de>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xuefeng Li <lixuefeng@loongson.cn>
From:   Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <22dedcf5-356c-3963-a4ec-a8413ce45997@loongson.cn>
Date:   Wed, 20 May 2020 12:57:58 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <20200519160334.GA16307@alpha.franken.de>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: AQAAf9DxP2rWuMReudY2AA--.67S3
X-Coremail-Antispam: 1UD129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
        VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUUYw7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E
        6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28Cjx
        kF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVWUJVWUCwA2z4x0Y4vE2Ix0cI8I
        cVCY1x0267AKxVWUJVW8JwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87
        Iv6xkF7I0E14v26F4UJVW0owAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAK
        zVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx
        8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY
        jI0SjxkI62AI1cAE67vIY487MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r
        4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF
        67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2I
        x0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_WFyUJVCq3wCI42IY
        6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvj
        DU0xZFpf9x0JUywZ7UUUUU=
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 05/20/2020 12:03 AM, Thomas Bogendoerfer wrote:
> On Tue, May 19, 2020 at 08:28:11PM +0800, Tiezhu Yang wrote:
>> After commit 9d0aaf98dc24 ("MIPS: SGI-IP27: Move all shared IP27
>> declarations to ip27-common.h"), ip27-common.h is included more
>> than once in ip27-timer.c, remove it.
>>
>> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> applied to mips-next. I only removed the second #include. If you
> want to clean this up further the includes and comment about
> ioc3_init() could be removed as well.

OK, thank you. I will do it later.

Thanks,
Tiezhu Yang

>
> Thomas.
>

