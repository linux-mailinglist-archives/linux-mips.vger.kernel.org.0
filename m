Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F93E1BD824
	for <lists+linux-mips@lfdr.de>; Wed, 29 Apr 2020 11:25:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726426AbgD2JZy (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 29 Apr 2020 05:25:54 -0400
Received: from mail.loongson.cn ([114.242.206.163]:41130 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726345AbgD2JZy (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 29 Apr 2020 05:25:54 -0400
Received: from [10.130.0.79] (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxr2sWSKlebrctAA--.12S3;
        Wed, 29 Apr 2020 17:25:42 +0800 (CST)
To:     chenhc@lemote.com
References: <CAAhV-H7uhPo_ZCTyt8eh9LSXXW7Unbr0SEXwG55GWLTksiNBWQ@mail.gmail.com>
Subject: Re: [PATCH v5] MIPS: Loongson: Add DMA support for LS7A
Cc:     hch@infradead.org, jiaxun.yang@flygoat.com,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        lixuefeng@loongson.cn, tsbogend@alpha.franken.de,
        yangtiezhu@loongson.cn
From:   Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <94c49604-faf0-486d-f0ac-296536178a22@loongson.cn>
Date:   Wed, 29 Apr 2020 17:25:42 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAAhV-H7uhPo_ZCTyt8eh9LSXXW7Unbr0SEXwG55GWLTksiNBWQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: AQAAf9Dxr2sWSKlebrctAA--.12S3
X-Coremail-Antispam: 1UD129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
        VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUUYT7AC8VAFwI0_Gr0_Xr1l1xkIjI8I6I8E
        6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28Cjx
        kF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8I
        cVCY1x0267AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87
        Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE
        6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AKxVW8JVWxJwAm72
        CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7Mxk0
        xIA0c2IEe2xFo4CEbIxvr21lc2xSY4AK67AK6r4fMxAIw28IcxkI7VAKI48JMxC20s026x
        CaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_
        JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r
        1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_
        WFyUJVCq3wCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r
        4UJbIYCTnIWIevJa73UjIFyTuYvjfUeID7DUUUU
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Sorry, I can not receive email today due to some unknown reason,
so I use the "mailto: link" in the Linux-MIPS Archive to reply.

 > Please use alpha-betical order here, which means put ls7a things
 > before rs780 things.

OK, thanks. I will modify it and send v6.

 > Why use a hardcoded 37? LS7A's node-id bits are configurable in BIOS.

Oh, the platform dependent implementation of __phys_to_dma()
and __dma_to_phys() are deleted, and ls7a_dma_config() is an
empty function, the hardware can translate address of node id
automatically for LS7A.

