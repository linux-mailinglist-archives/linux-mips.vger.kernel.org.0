Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6080023DDB5
	for <lists+linux-mips@lfdr.de>; Thu,  6 Aug 2020 19:14:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730249AbgHFRN1 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 6 Aug 2020 13:13:27 -0400
Received: from elvis.franken.de ([193.175.24.41]:36776 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728618AbgHFRNK (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 6 Aug 2020 13:13:10 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1k3cy8-0001w1-00; Thu, 06 Aug 2020 12:17:52 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 0C114C0C5C; Thu,  6 Aug 2020 12:17:34 +0200 (CEST)
Date:   Thu, 6 Aug 2020 12:17:34 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Tiezhu Yang <yangtiezhu@loongson.cn>
Cc:     Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhc@lemote.com>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MIPS: Introduce cmdline argument writecombine=
Message-ID: <20200806101733.GA8136@alpha.franken.de>
References: <1596697741-3561-1-git-send-email-yangtiezhu@loongson.cn>
 <10e04885-b775-e7db-b927-6400382fd32d@flygoat.com>
 <cc0c8b89-748d-0d38-bcc8-1c2dbb0996bf@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <cc0c8b89-748d-0d38-bcc8-1c2dbb0996bf@loongson.cn>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Aug 06, 2020 at 04:32:13PM +0800, Tiezhu Yang wrote:
> On 08/06/2020 03:39 PM, Jiaxun Yang wrote:
> >
> >
> >在 2020/8/6 下午3:09, Tiezhu Yang 写道:
> >>Loongson processors have a writecombine issue that maybe failed to
> >>write back framebuffer used with ATI Radeon or AMD GPU at times,
> >>after commit 8a08e50cee66 ("drm: Permit video-buffers writecombine
> >>mapping for MIPS"), there exists some errors such as blurred screen
> >>and lockup, and so on.
> >>
> >>With this patch, disable writecombine by default for Loongson64 to
> >>work well with ATI Radeon or AMD GPU, and it has no influence on the
> >>other platforms due to writecombine is enabled by default.
> >>
> >>Additionally, if it is necessary, writecombine=on can be set manually
> >>in the cmdline to enhance the performance for Loongson LS7A integrated
> >>graphics in the future.
> >>
> >>[   60.958721] radeon 0000:03:00.0: ring 0 stalled for more than
> >>10079msec
> >>[   60.965315] radeon 0000:03:00.0: GPU lockup (current fence id
> >>0x0000000000000112 last fence id 0x000000000000011d on ring 0)
> >>[   60.976525] radeon 0000:03:00.0: ring 3 stalled for more than
> >>10086msec
> >>[   60.983156] radeon 0000:03:00.0: GPU lockup (current fence id
> >>0x0000000000000374 last fence id 0x00000000000003a8 on ring 3)
> >Hi Tiezhu,
> >
> >Thanks for your patch.
> >Personally I didn't have any issue with writecombine on my test systems,
> >but there
> >are some complains about unstable graphic card from users. So generally a
> >cmdline
> >writecombine switch is necessary.

no, if there is hardware which can't work with writecombining enabled
the driver should disable it by it's own and not by some user switch.
It might even be better to revert the patch enabling writecombining
blindly and add code to enable it for hardware where it works.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
