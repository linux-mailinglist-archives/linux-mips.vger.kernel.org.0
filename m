Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E6D00744BE1
	for <lists+linux-mips@lfdr.de>; Sun,  2 Jul 2023 02:14:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229684AbjGBAOB (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 1 Jul 2023 20:14:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229540AbjGBAOA (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 1 Jul 2023 20:14:00 -0400
Received: from h1.cmg2.smtp.forpsi.com (h1.cmg2.smtp.forpsi.com [81.2.195.188])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF83010CE
        for <linux-mips@vger.kernel.org>; Sat,  1 Jul 2023 17:13:54 -0700 (PDT)
Received: from lenoch ([91.218.190.200])
        by cmgsmtp with ESMTPSA
        id FkitqyFctv5uIFkiuqC7jz; Sun, 02 Jul 2023 02:13:52 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=triops.cz; s=f2019;
        t=1688256832; bh=r+bN89+Ej+OGVe/79zQUtZNTrjIgHnWp2eL6JIFwyQI=;
        h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
        b=K+JyHFoeW6rGRrPpLfplvzFP5h00yqNjQeNe3MzneiR1Wi4qL/gMMrWeupbULSRFF
         jxQVXvE0ghUHfWJs2pTF28+I3v03IscV+lMjTMrm0nSi9p0mMeamMfRM/vukZWYpf8
         FT9fPuoWMvzvLfgiMPUy3tD+4pBBMHYT1WhP5VNkXF2Op6mBxfeNtawDcVaQqSBnTV
         iDveIDE60+oKZCVBtgDpBwCw2WFL9sI/3N+W5NrdKZXV7kAB+nhH7vwCfJ0CuB5iqb
         OxKP6IEqUqpXA0fKuJ503miAU7MvV8KcoLQBvwTVBtdLXq/gocObQvM8qYU67NJlEO
         g7ZFHc1bSR1KQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=triops.cz; s=f2019;
        t=1688256832; bh=r+bN89+Ej+OGVe/79zQUtZNTrjIgHnWp2eL6JIFwyQI=;
        h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
        b=K+JyHFoeW6rGRrPpLfplvzFP5h00yqNjQeNe3MzneiR1Wi4qL/gMMrWeupbULSRFF
         jxQVXvE0ghUHfWJs2pTF28+I3v03IscV+lMjTMrm0nSi9p0mMeamMfRM/vukZWYpf8
         FT9fPuoWMvzvLfgiMPUy3tD+4pBBMHYT1WhP5VNkXF2Op6mBxfeNtawDcVaQqSBnTV
         iDveIDE60+oKZCVBtgDpBwCw2WFL9sI/3N+W5NrdKZXV7kAB+nhH7vwCfJ0CuB5iqb
         OxKP6IEqUqpXA0fKuJ503miAU7MvV8KcoLQBvwTVBtdLXq/gocObQvM8qYU67NJlEO
         g7ZFHc1bSR1KQ==
Date:   Sun, 2 Jul 2023 02:13:50 +0200
From:   Ladislav Michl <oss-lists@triops.cz>
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
Subject: Re: [PATCH 10/11] usb: dwc3: dwc3-octeon: Move node parsing into
 driver probe
Message-ID: <ZKDBPijPY5hbv9E4@lenoch>
References: <ZJC165p0Mj4jHcBh@lenoch>
 <ZJC3eK8QMxShyZDt@lenoch>
 <20230630232733.rvibxvrcqkkj7dpw@synopsys.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230630232733.rvibxvrcqkkj7dpw@synopsys.com>
X-CMAE-Envelope: MS4wfHwXn/EVlo7Bknvbrd9vcu9qtXanZpMdY4AEfkaDCp5/Lrk02KPy53P+plzOqnWQS3iBdQqfXDOF11R6KT814kXrpM4fHFlQsvceqJM+4/DApMnXIEhE
 Md3iqfvNCGduS4GNosPgU34Vu6oj53eNTZSj2Z5j7wRnQFVwG4LRY84FABXJrey8L4qAGqnCv5T9XBmkc3TUcDjlw646ECcaZTygqmZtKfKafVgTtozxSJ0M
 QzxJMSxnRa0SzeS7FntYOQ==
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi,

thank you for review, v2 is about to be sent, here just let
me anwer issue I didn't address there.

On Fri, Jun 30, 2023 at 11:27:37PM +0000, Thinh Nguyen wrote:
> On Mon, Jun 19, 2023, Ladislav Michl wrote:
[snip]
> > +	ref_clk_sel = 2;
> 
> Can we use macro instead of magic numbers?

This is a bit problematic, comment above USBDRD_UCTL_CTL_REF_CLK_SEL
says:
/* Reference clock select for SuperSpeed and HighSpeed PLLs:
 *      0x0 = Both PLLs use DLMC_REF_CLK0 for reference clock
 *      0x1 = Both PLLs use DLMC_REF_CLK1 for reference clock
 *      0x2 = SuperSpeed PLL uses DLMC_REF_CLK0 for reference clock &
 *            HighSpeed PLL uses PLL_REF_CLK for reference clck
 *      0x3 = SuperSpeed PLL uses DLMC_REF_CLK1 for reference clock &
 *            HighSpeed PLL uses PLL_REF_CLK for reference clck
 */
So I really cannot imagine sane name. Also please note, that field
and register names were created to match documentation. Values,
however, have no defined names, so I would need to invent them.
That is something I'd like to avoid as it might be confusing.

And last, but to least: Octeon would deserve proper clock api
(clk driver to be implemented). So hopefully that code get
replaced with more sane one. For now, I just kept compatibility
with current DT.

Thanks,
	ladis
