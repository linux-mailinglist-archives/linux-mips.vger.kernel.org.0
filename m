Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7EF6A3D5127
	for <lists+linux-mips@lfdr.de>; Mon, 26 Jul 2021 03:52:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230272AbhGZBLm convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-mips@lfdr.de>); Sun, 25 Jul 2021 21:11:42 -0400
Received: from mail.loongson.cn ([114.242.206.163]:42626 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230116AbhGZBLm (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sun, 25 Jul 2021 21:11:42 -0400
Received: from smtpclient.apple (unknown [222.209.10.128])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9BxQOI_Ff5gcN4jAA--.48565S3;
        Mon, 26 Jul 2021 09:52:00 +0800 (CST)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
From:   loongson <huangpei@loongson.cn>
Mime-Version: 1.0 (1.0)
Subject: Re: [RFC]: Maybe revert 'MIPS: add PMD table accounting into MIPS'pmd_alloc_one' from 5.4 LTS?
Date:   Mon, 26 Jul 2021 09:51:59 +0800
Message-Id: <4E1F7C27-B9E1-4078-A336-AC3198447B55@loongson.cn>
References: <cca35e7b-d62e-68db-fba4-53689e884d2f@gentoo.org>
Cc:     Linux/MIPS <linux-mips@vger.kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
In-Reply-To: <cca35e7b-d62e-68db-fba4-53689e884d2f@gentoo.org>
To:     Joshua Kinard <kumba@gentoo.org>
X-Mailer: iPhone Mail (18G69)
X-CM-TRANSID: AQAAf9BxQOI_Ff5gcN4jAA--.48565S3
X-Coremail-Antispam: 1UD129KBjvdXoW7XFWDJF1UtrW3JF1rAFW3Awb_yoWkGFX_Za
        1F9rsFk34UA39xKFnrJrW3Zw12gryDur98Z3y2vrWxXws8XwsrA3s0gF9F9w1rAw1avFn8
        KF4DXr97Ar1qqjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUIcSsGvfJTRUUUb2kYjsxI4VWDJwAYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I
        6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM2
        8CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0
        cI8IcVCY1x0267AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwV
        C2z280aVCY1x0267AKxVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVAC
        Y4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJV
        W8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lc2xSY4AK67AK6w4l42xK
        82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGw
        C20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1Y6r17MIIYrxkI7VAKI48J
        MIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMI
        IF0xvE42xK8VAvwI8IcIk0rVW3JVWrJr1lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2
        z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU8BWlDUUUUU==
X-CM-SenderInfo: xkxd0whshlqz5rrqw2lrqou0/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Sure, it is done


> 在 2021年7月25日，07:22，Joshua Kinard <kumba@gentoo.org> 写道：
> 
> ﻿On 7/20/2021 22:11, Huang Pei wrote:
>> On Tue, Jul 20, 2021 at 08:45:45PM -0400, Joshua Kinard wrote:
>> Hi, 
> 
> [snip]
> 
>>> 
>>> - there is no call to pgtable_pmd_page_dtor() in pmd_free() in MIPS'
>>> pgalloc.  The commit message indicates that pmd_free in asm-generic will
>>> handle this, but that function doesn't exist in 5.4, leading to mismatched
>>> implementations.
>> 
>> Yes, my fix is to fix the mismatch. 
>> 
>> I think all stable branches before 5.10 should *not* apply this my patch
> 
> Can you submit a revert of this commit to stable@vger.kernel.org so that
> Greg can include it in an upcoming update to the stable kernels <5.10?
> 
> Thanks!,
> 
> -- 
> Joshua Kinard
> Gentoo/MIPS
> kumba@gentoo.org
> rsa6144/5C63F4E3F5C6C943 2015-04-27
> 177C 1972 1FB8 F254 BAD0 3E72 5C63 F4E3 F5C6 C943
> 
> "The past tempts us, the present confuses us, the future frightens us.  And
> our lives slip away, moment by moment, lost in that vast, terrible in-between."
> 
> --Emperor Turhan, Centauri Republic

