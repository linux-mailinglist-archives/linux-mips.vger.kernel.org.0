Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC85734CDA0
	for <lists+linux-mips@lfdr.de>; Mon, 29 Mar 2021 12:09:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232027AbhC2KI2 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 29 Mar 2021 06:08:28 -0400
Received: from mail.kernel.org ([198.145.29.99]:38068 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231675AbhC2KH5 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 29 Mar 2021 06:07:57 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4C2D161585;
        Mon, 29 Mar 2021 10:07:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617012476;
        bh=pMPh6eyELHUsFo1+GSOTU018GXuHnqwmLWfjowXKpSM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=f9EhhMV0Q2/acyWJ/ZfxNWBKDPSPFcewP+yYd7grUMYR6ohYLn/GQbjkVRfpx6hy1
         qlz2kGTV6H9hIJ3P83OFCRWasmAPh0B4tg4uRiF/UiE/RSNCbR5Vp/lFYg26JDmhOc
         MWyUZuzkuVH70jdZJzCAyLBOqrXhFTb1bKdlZHGSYbFlC9bk2RUcV6QNHQmOXZOSfw
         MB8cWs05TS9x1iAejddICQs8gS82J+9FM1MYdvz//gI0U56nk09G1BsYCdMIXSnO7c
         KleBb0hQlKjIQJz/LgOJaH5ew9SHfhQgI3a4l184IRzCzZU/6ZjlfekxQPDfmmV3Jo
         EOvtS+AxR38PQ==
Date:   Mon, 29 Mar 2021 11:07:51 +0100
From:   Will Deacon <will@kernel.org>
To:     Daniel Walker <danielwa@cisco.com>
Cc:     Christophe Leroy <christophe.leroy@csgroup.eu>,
        Rob Herring <robh@kernel.org>,
        Daniel Gimpelevich <daniel@gimpelevich.san-francisco.ca.us>,
        Andrew Morton <akpm@linux-foundation.org>,
        X86 ML <x86@kernel.org>,
        "open list:MIPS" <linux-mips@vger.kernel.org>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        xe-linux-external@cisco.com, Michael Ellerman <mpe@ellerman.id.au>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 3/7] powerpc: convert config files to generic cmdline
Message-ID: <20210329100750.GB3207@willie-the-truck>
References: <20210309000247.2989531-4-danielwa@cisco.com>
 <5f865584-09c9-d21f-ffb7-23cf07cf058e@csgroup.eu>
 <20210309212944.GR109100@zorba>
 <e4899874-1684-fa1b-443e-f4e478e05e31@csgroup.eu>
 <CAL_JsqKm76jRQYDcu3rGyUWKPLspoO=EZW_WFy=zAK+m_JYCTg@mail.gmail.com>
 <20fd7d44-8c39-48bc-25c3-990be9d9d911@csgroup.eu>
 <20210325195956.GM109100@zorba>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210325195956.GM109100@zorba>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Mar 25, 2021 at 12:59:56PM -0700, Daniel Walker wrote:
> On Thu, Mar 25, 2021 at 01:03:55PM +0100, Christophe Leroy wrote:
> > 
> > Ok, so you agree we don't need to provide two CMDLINE, one to be appended and one to be prepended.
> > 
> > Let's only provide once CMDLINE as of today, and ask the user to select
> > whether he wants it appended or prepended or replacee. Then no need to
> > change all existing config to rename CONFIG_CMDLINE into either of the new
> > ones.
> > 
> > That's the main difference between my series and Daniel's series. So I'll
> > finish taking Will's comment into account and we'll send out a v3 soon.
> 
> It doesn't solve the needs of Cisco, I've stated many times your changes have
> little value. Please stop submitting them.

FWIW, they're useful for arm64 and I will gladly review the updated series.

I don't think asking people to stop submitting patches is ever the right
answer. Please don't do that.

Will
