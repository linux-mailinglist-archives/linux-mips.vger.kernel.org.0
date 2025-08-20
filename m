Return-Path: <linux-mips+bounces-10399-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 812F5B2E152
	for <lists+linux-mips@lfdr.de>; Wed, 20 Aug 2025 17:39:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2E52BA26E93
	for <lists+linux-mips@lfdr.de>; Wed, 20 Aug 2025 15:24:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5267F334388;
	Wed, 20 Aug 2025 15:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HCLvxhhm"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2277F3277BD;
	Wed, 20 Aug 2025 15:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755703121; cv=none; b=TjIqR5hQ0tGNu+sGwfRK/eE5rK0c52kYhiUtypyYSPMMVfFW67N2jrNu0aWPbZR+8+0Tc6pySWhCzghcsCtXGMhVd364zoCiese2vA2I3cL/vMwuDhDIibWrUK9lW5iklUmC89zawvqQilU7Kf+D+Or/Ak7lTg+G7LGfX8xEEF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755703121; c=relaxed/simple;
	bh=hpA3HB2nYO+BOH0DraEZkK1mUoeOKRwSQx3yrhDgd8Q=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ObXxoIc2gqMN9jyrOfCMdOUuaZWyYEUWVHrc4+D8ZsN3Z4BL5k3+i3kBw/AEtJzw7nsokFpu3fltauJAu/N8Vuf7W3YoT6d4WurucEsInqtUMXfyw83ISiVxdBcD1nhfrgceGu70bmexnXbMZ00SN0hutuQjd9AV4Vw2NgZsOg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HCLvxhhm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E18FC4CEE7;
	Wed, 20 Aug 2025 15:18:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755703120;
	bh=hpA3HB2nYO+BOH0DraEZkK1mUoeOKRwSQx3yrhDgd8Q=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=HCLvxhhm7iyY1MQFUj/zAFdoBTuOMk1HHlO/HjXQ+cRvr4KrGI60RVjvPB60qPNw9
	 ZZVLruQeIWyxJZtgPMj00/pe0CcWD7EUhdE+9fHtyPBSHEWkYVVvjhNT4Uz8QLC5EE
	 6eN6TASlRFmrHUkJc5UDGt7gElEoQzf7AR4vnuWG+j84GK5l99mawe6d6YVYN5S8EJ
	 9li+OvVZiydevexmUPSEMpkG76w25cDmjGkOdWlVZpDJKXfBipjBIzJegODdGkSbb/
	 fTTPAOJgdX8h0rmXvl1cf/PYwTWuF+O7BwMTTXVuLRNsNuIEylZyrwd3asU+4XJXsT
	 mEVH02Q1N7eQw==
Date: Wed, 20 Aug 2025 08:18:39 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Aleksander Jan Bajkowski <olek2@wp.pl>, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
 john@phrozen.org, devicetree@vger.kernel.org, netdev@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v2 0/2] mips: lantiq: fix ethernet support
Message-ID: <20250820081839.4eeaf5eb@kernel.org>
In-Reply-To: <aKWiWX50F6kQNc13@alpha.franken.de>
References: <20250817131022.3796476-1-olek2@wp.pl>
	<20250819182641.1b7ff210@kernel.org>
	<aKWiWX50F6kQNc13@alpha.franken.de>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 20 Aug 2025 12:24:25 +0200 Thomas Bogendoerfer wrote:
> On Tue, Aug 19, 2025 at 06:26:41PM -0700, Jakub Kicinski wrote:
> > On Sun, 17 Aug 2025 14:49:05 +0200 Aleksander Jan Bajkowski wrote:  
> > > This series fixes broken Ethernet in the upstream danube dts. The
> > > driver doesn't attach due to missing burst length property. OpenWRT
> > > has its own dts, which is correct, so the problem has only been
> > > spotted now. Other dts inconsistencies with bindings have been
> > > fixed as well.  
> > 
> > Hi Thomas, Aleksander tagged these for net, are you okay with us taking
> > them via the networking tree? Looks like these are half DTS changes.  
> 
> Aleksander is further changing the Lantiq DTs, so I'd prefer to take
> this patches through the MIPS tree.

SG! Feel free to add:

Acked-by: Jakub Kicinski <kuba@kernel.org>
-- 
pw-bot: not-applicable

