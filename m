Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C921F30F330
	for <lists+linux-mips@lfdr.de>; Thu,  4 Feb 2021 13:33:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236010AbhBDMcA (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 4 Feb 2021 07:32:00 -0500
Received: from mail.loongson.cn ([114.242.206.163]:58470 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S235819AbhBDMb5 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 4 Feb 2021 07:31:57 -0500
Received: from [10.130.0.55] (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxj_IP6RtgbqwEAA--.6216S3;
        Thu, 04 Feb 2021 20:31:13 +0800 (CST)
To:     "open list:MIPS" <linux-mips@vger.kernel.org>
From:   Jinyang He <hejinyang@loongson.cn>
Subject: [Question] How to save_stack_trace_tsk_reliable() on mips?
Message-ID: <a0823990-420f-8091-7866-8ad588ef542d@loongson.cn>
Date:   Thu, 4 Feb 2021 20:31:11 +0800
User-Agent: Mozilla/5.0 (X11; Linux mips64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: AQAAf9Dxj_IP6RtgbqwEAA--.6216S3
X-Coremail-Antispam: 1UD129KBjvdXoWrKr4fXF43AFWUZrykCr17Jrb_yoWDJFb_G3
        y8AF9rJrsIqa9xArZ7JF18Aayag3yjgFykt3yqqF13Jw1rKF42gFZ2yw1xZryUKw4DKF95
        tF93X348W34YgjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUIcSsGvfJTRUUUbc8YjsxI4VWkKwAYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I
        6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM2
        8CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0
        cI8IcVCY1x0267AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4
        A2jsIEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IE
        w4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r4j6F4UMc
        vjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCYjI0SjxkI62AI1cAE67vIY487MxAI
        w28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr
        4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUJVWUXwCIc40Y0x0EwIxG
        rwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8Jw
        CI42IY6xAIw20EY4v20xvaj40_WFyUJVCq3wCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY
        6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUy75rDUUUU
X-CM-SenderInfo: pkhmx0p1dqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi, all,

Excuse me. Here is a question mail. How to get a reliable stack
of tasks on mips?

First, why save_stack_trace_tsk() to get stack is unreliable? Is it
because the asm code does not obey with gcc's stack rules, or others?

Secondly, can we use some methods to make the task stack reliable? For
example, use the fp register, can this method work? But it seems make
no sense for asm code unless each asm code do some fp work.

I found that the powerpc implemented save_stack_trace_tsk_reliable(),
and the x86 and s390 implemented the arch_stack_walk_reliable(). x86
implemented it through ORC unwind. For powerpc, it may implement it
through its ABI (I guess, I'm not familiar with them). Do we have a
chance to implement it in some way?

Finally, I found that some emails related to ORC unwind on ARM from the
livepatch mail list. It is difficult for me to understand. Is anyone
interested in ORC unwind on MIPS and have researched it?

Any comment is welcome. :-)

Thanks!

