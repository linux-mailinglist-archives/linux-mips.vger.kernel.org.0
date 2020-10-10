Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EDC2C28A32A
	for <lists+linux-mips@lfdr.de>; Sun, 11 Oct 2020 01:07:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390481AbgJJW5Y (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 10 Oct 2020 18:57:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730825AbgJJTwD (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 10 Oct 2020 15:52:03 -0400
Received: from orcam.me.uk (unknown [IPv6:2001:4190:8020::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 065D8C0610D0;
        Sat, 10 Oct 2020 05:11:24 -0700 (PDT)
Received: from bugs.linux-mips.org (eddie.linux-mips.org [IPv6:2a01:4f8:201:92aa::3])
        by orcam.me.uk (Postfix) with ESMTPS id 683AD2BE086;
        Sat, 10 Oct 2020 13:11:22 +0100 (BST)
Date:   Sat, 10 Oct 2020 13:11:18 +0100 (BST)
From:   "Maciej W. Rozycki" <macro@linux-mips.org>
To:     Sergei Shtylyov <sergei.shtylyov@gmail.com>
cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] MIPS: cpu-probe: move fpu probing/handling into
 its own file
In-Reply-To: <0d87a08c-3ae3-fc32-8e96-5692944b8289@gmail.com>
Message-ID: <alpine.LFD.2.21.2010101259400.866917@eddie.linux-mips.org>
References: <20201008213327.11603-1-tsbogend@alpha.franken.de> <alpine.LFD.2.21.2010100128110.866917@eddie.linux-mips.org> <0d87a08c-3ae3-fc32-8e96-5692944b8289@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sat, 10 Oct 2020, Sergei Shtylyov wrote:

> >   Umm, this has formatting issues with lines extending beyond column #80.
> 
>    80 columns are no longer a line length limit -- 100 is, IIRC.

 I don't think anything has changed here:

"The preferred limit on the length of a single line is 80 columns.

"Statements longer than 80 columns should be broken into sensible chunks,
unless exceeding 80 columns significantly increases readability and does
not hide information."

-- from Documentation/process/coding-style.rst, "Breaking long lines and 
strings".

 And if it were to change anytime, then I think it would make sense for 
such a new rule to apply to new files only.  I would be strongly against 
it anyway, as the human's capability to parse lines has not changed when 
it comes to the quantity of characters easily processed at once: the angle 
spanned by eyes is hardwired.  For this reason the GNU toolchain projects 
keep the limit even lower, at 74 columns (after extensive discussions).

  Maciej
