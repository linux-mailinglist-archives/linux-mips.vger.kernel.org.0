Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C27266A3E5E
	for <lists+linux-mips@lfdr.de>; Mon, 27 Feb 2023 10:31:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229567AbjB0Jbs (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 27 Feb 2023 04:31:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229690AbjB0Jbs (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 27 Feb 2023 04:31:48 -0500
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 8ED93900F
        for <linux-mips@vger.kernel.org>; Mon, 27 Feb 2023 01:31:45 -0800 (PST)
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1pWZrE-0000sc-00; Mon, 27 Feb 2023 10:31:44 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id B00E7C0244; Mon, 27 Feb 2023 10:31:26 +0100 (CET)
Date:   Mon, 27 Feb 2023 10:31:26 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
Subject: Re: [PATCH 2/2] MIPS: cevt-r4k: Offset counter value for clearing
 compare interrupt
Message-ID: <20230227093126.GA6152@alpha.franken.de>
References: <20230225221008.8520-1-jiaxun.yang@flygoat.com>
 <20230225221008.8520-3-jiaxun.yang@flygoat.com>
 <20230226232331.GA9208@alpha.franken.de>
 <579403EF-8E0D-4AC9-9AB1-51CBB433E114@flygoat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <579403EF-8E0D-4AC9-9AB1-51CBB433E114@flygoat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Feb 27, 2023 at 01:22:47AM +0000, Jiaxun Yang wrote:
> 
> 
> > 2023年2月26日 23:23，Thomas Bogendoerfer <tsbogend@alpha.franken.de> 写道：
> > 
> > On Sat, Feb 25, 2023 at 10:10:08PM +0000, Jiaxun Yang wrote:
> >> In c0_compare_int_usable we clear compare interrupt by write value
> >> just read out from counter to compare register.
> >> 
> >> However sometimes if those all instructions are graduated together
> >> then it's possible that at the time compare register is written, the
> >> counter haven't progressed, thus the interrupt is triggered again.
> >> 
> >> It also applies to QEMU that instructions is execuated significantly
> >> faster then counter.
> >> 
> >> Offset the counter value a litlle bit to prevent that happen.
> >> 
> >> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> >> ---
> >> arch/mips/kernel/cevt-r4k.c | 3 +++
> >> 1 file changed, 3 insertions(+)
> >> 
> >> diff --git a/arch/mips/kernel/cevt-r4k.c b/arch/mips/kernel/cevt-r4k.c
> >> index 32ec67c9ab67..bbc422376e97 100644
> >> --- a/arch/mips/kernel/cevt-r4k.c
> >> +++ b/arch/mips/kernel/cevt-r4k.c
> >> @@ -200,6 +200,8 @@ int c0_compare_int_usable(void)
> >> */
> >> if (c0_compare_int_pending()) {
> >> cnt = read_c0_count();
> >> + // Drawdown a little bit in case counter haven't progressed
> > 
> > no C++ comments
> > 
> >> + cnt -= COMPARE_INT_SEEN_TICKS;
> >> write_c0_compare(cnt);
> >> back_to_back_c0_hazard();
> >> while (read_c0_count() < (cnt  + COMPARE_INT_SEEN_TICKS))
> > 
> > this doesn't make sense. clearing of the interrupts happes because of
> > this loop. So either COMPARE_INT_SEEN_TICKS is too small or you are
> > hunting a different bug.
> 
> Clearing interrupt happens in write_c0_compare but the problem is the interrupt
> does really get cleared because it triggered again straight away.

the function you are patching is a test function whether counter/compare
is usable, so it's not in the normal timer handling. See a problem there
would more to broken hardware than to a bug in that function.

> Had confirmed issue on MIPS I6500 uarch simulation trace.

so not seen on real hardware ?

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
