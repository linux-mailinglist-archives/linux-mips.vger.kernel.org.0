Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B23CF165545
	for <lists+linux-mips@lfdr.de>; Thu, 20 Feb 2020 03:53:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727370AbgBTCxc (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 19 Feb 2020 21:53:32 -0500
Received: from mail.loongson.cn ([114.242.206.163]:39354 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727211AbgBTCxb (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 19 Feb 2020 21:53:31 -0500
Received: from [192.168.68.111] (unknown [111.18.94.191])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxX9qg9E1eHaMRAA--.22S3;
        Thu, 20 Feb 2020 10:53:21 +0800 (CST)
To:     paulburton@kernel.org
References: <1580875713-18252-2-git-send-email-yangtiezhu@loongson.cn>
Subject: Re: [PATCH v3 2/2] MIPS: Add support for Desktop Management Interface
 (DMI)
Cc:     chenhc@lemote.com, jdelvare@suse.com, jdelvare@suse.de,
        jiaxun.yang@flygoat.com, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org, lixuefeng@loongson.cn,
        ralf@linux-mips.org, yangyinglu@loongson.cn
From:   Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <0d809d1a-3dd4-96ef-3e86-978d5d653cac@loongson.cn>
Date:   Thu, 20 Feb 2020 10:53:20 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <1580875713-18252-2-git-send-email-yangtiezhu@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: AQAAf9DxX9qg9E1eHaMRAA--.22S3
X-Coremail-Antispam: 1UD129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
        VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUUYW7AC8VAFwI0_Gr0_Xr1l1xkIjI8I6I8E
        6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28Cjx
        kF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8I
        cVCY1x0267AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z2
        80aVCY1x0267AKxVWxJr0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IE
        w4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r1j6r4UMc
        vjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1l
        FIxGxcIEc7CjxVA2Y2ka0xkIwI1lc7I2V7IY0VAS07AlzVAYIcxG8wCY02Avz4vE14v_Gr
        1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWU
        JVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7V
        AKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j
        6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWrJr0_WFyUJwCI42IY6I8E87Iv67AKxVWUJVW8Jw
        CI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUF3kuDUUU
        U
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Paul,

Any questions or suggestions?
Could you apply this patch to the MIPS tree?

Thanks,

Tiezhu Yang

