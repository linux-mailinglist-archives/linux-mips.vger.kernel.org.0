Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D59E0165532
	for <lists+linux-mips@lfdr.de>; Thu, 20 Feb 2020 03:44:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727576AbgBTCoa (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 19 Feb 2020 21:44:30 -0500
Received: from mail.loongson.cn ([114.242.206.163]:37488 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727402AbgBTCo3 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 19 Feb 2020 21:44:29 -0500
Received: from [192.168.68.111] (unknown [111.18.94.191])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxz9108k1ev6IRAA--.27S3;
        Thu, 20 Feb 2020 10:44:15 +0800 (CST)
To:     jdelvare@suse.com, jdelvare@suse.de
References: <1580875713-18252-1-git-send-email-yangtiezhu@loongson.cn>
Subject: Re: [PATCH v3 1/2] firmware: dmi: Add macro
 SMBIOS_ENTRY_POINT_SCAN_START
Cc:     jiaxun.yang@flygoat.com, chenhc@lemote.com,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        lixuefeng@loongson.cn, paulburton@kernel.org, ralf@linux-mips.org
From:   Tiezhu Yang <yangtiezhu@loongson.cn>
Message-ID: <8ee01022-d3d1-8145-1a0b-ba77c5bb7101@loongson.cn>
Date:   Thu, 20 Feb 2020 10:43:56 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <1580875713-18252-1-git-send-email-yangtiezhu@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: AQAAf9Dxz9108k1ev6IRAA--.27S3
X-Coremail-Antispam: 1UD129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
        VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUUYz7AC8VAFwI0_Gr0_Xr1l1xkIjI8I6I8E
        6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28Cjx
        kF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8I
        cVCY1x0267AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z2
        80aVCY1x0267AKxVWxJr0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IE
        w4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMc
        vjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1l
        c7I2V7IY0VAS07AlzVAYIcxG8wCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJV
        W8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF
        1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6x
        IIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6rW3Jr0E3s1lIxAI
        cVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa
        73UjIFyTuYvjfUoOJ5UUUUU
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Jean,

Since this patch is independent and it has no any negative influence,
could you apply it to your DMI tree first?

Thanks,

Tiezhu Yang

