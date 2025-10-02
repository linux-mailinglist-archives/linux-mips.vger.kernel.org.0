Return-Path: <linux-mips+bounces-11599-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F2CF0BB5A27
	for <lists+linux-mips@lfdr.de>; Fri, 03 Oct 2025 01:48:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A9784487CA5
	for <lists+linux-mips@lfdr.de>; Thu,  2 Oct 2025 23:48:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 273F5285412;
	Thu,  2 Oct 2025 23:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UxV+eH4P"
X-Original-To: linux-mips@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BB9A1E89C;
	Thu,  2 Oct 2025 23:48:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759448906; cv=none; b=q18g1ShXoruS6HXg1cz1QP/1AisigtraCUesPCpQLtZe8Dr138xkm9HVSFYC6A7M7F5pEfVqm33VYuMwMwgLU2g4d1qk6cQkVwmwsAHNAcAjeuz5SZtuRAy67v6Wf1ibvnaR6+KbnSB0zfu6R2QeNvnKRdQQ7NBGrwW0id0qjS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759448906; c=relaxed/simple;
	bh=KkhJlJGFWueeeCVdSjolDhypxFebydriOlAkxnD8EWc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZQco6+Y63E9561RB02HCl82d6XG3i4Wv96oMJWxCABezkJBfNAY1s8GeR++v7FEyeqZJu8/LkXyKCbcGNcK5R+AhzJgm7pqmuk2ju0kr0CQXRbvkUIJCNW3DIsbotpa23Bi6gUXpiU4Gl34bzvMEvWCGG1NEfgEQ0j/eHH6LayM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UxV+eH4P; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759448904; x=1790984904;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=KkhJlJGFWueeeCVdSjolDhypxFebydriOlAkxnD8EWc=;
  b=UxV+eH4P9meYaxuFXRLjmrqKoxqe46+QomQzMWTR4XPfWIgrQAVPKfxw
   ajZCEPY+ZtS5P3ikcURh4c4TceresfxidjdSO31boTpHKdO4lHmSn8cHf
   z1OkgekUHJFyefVUj+tySxTucw/KnnpsF64Vx3NeD3uxbxOL1qwWrwmyR
   y83LRMPruz3hkuY/br5mBa6pJ5cDhuFgNDr1Cfrl8FKVBCwEFbututRQz
   8l1TX9fUZwXuBsubadSxdmvBPj7/bCRQ8LTHiVQ6hXyxvawbtzsbWtc63
   RYWmHHly8h1gVPIFtumisHAHfmQsEa2CiNCUAZBC+qLERZa/0BtjKVSOK
   Q==;
X-CSE-ConnectionGUID: 2WmVYBdCQBilQnqrz1HAGA==
X-CSE-MsgGUID: pmWo/sOVQrGkG879jGDuyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11570"; a="61784775"
X-IronPort-AV: E=Sophos;i="6.18,310,1751266800"; 
   d="scan'208";a="61784775"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2025 16:48:24 -0700
X-CSE-ConnectionGUID: eO04ralzQV6yjM/a3Wup7g==
X-CSE-MsgGUID: PcypzyQSQKCGGKs0LGl1bg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,310,1751266800"; 
   d="scan'208";a="184451277"
Received: from cmdeoliv-mobl4.amr.corp.intel.com (HELO [10.125.110.34]) ([10.125.110.34])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2025 16:48:21 -0700
Message-ID: <22893cc9-4fd2-451d-aca4-128fda88490b@intel.com>
Date: Thu, 2 Oct 2025 16:48:20 -0700
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/8] CMDLINE: x86: convert to generic builtin command line
To: "Daniel Walker (danielwa)" <danielwa@cisco.com>
Cc: Will Deacon <will@kernel.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>, Rob Herring
 <robh@kernel.org>,
 Daniel Gimpelevich <daniel@gimpelevich.san-francisco.ca.us>,
 Andrew Morton <akpm@linux-foundation.org>,
 Pratyush Brahma <quic_pbrahma@quicinc.com>,
 Tomas Mudrunka <tomas.mudrunka@gmail.com>,
 Sean Anderson <sean.anderson@seco.com>, "x86@kernel.org" <x86@kernel.org>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>,
 "xe-linux-external(mailer list)" <xe-linux-external@cisco.com>,
 Ruslan Ruslichenko <rruslich@cisco.com>,
 Ruslan Bilovol <ruslan.bilovol@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20231110013817.2378507-1-danielwa@cisco.com>
 <20231110013817.2378507-7-danielwa@cisco.com>
 <00c11f75-7400-4b2a-9a5d-10fc62363835@intel.com> <aN7n_5oiPjk-dCyJ@goliath>
 <c8b65db3-a6cf-479d-9a83-23cbc62db1ef@intel.com> <aN7vKgcUeQgCFglQ@goliath>
 <a2be781f-96b5-47d1-81fa-b20395ca293a@intel.com> <aN8NHojvtyKbX2Cs@goliath>
From: Dave Hansen <dave.hansen@intel.com>
Content-Language: en-US
Autocrypt: addr=dave.hansen@intel.com; keydata=
 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
In-Reply-To: <aN8NHojvtyKbX2Cs@goliath>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/2/25 16:39, Daniel Walker (danielwa) wrote:
>> He's a pretty nice guy and has been active in this thread, so I'm
>> kinda surprised to hear you're having a hard time there. I'd just
>> try asking nicely. I'm pretty sure he's "ardb" on the usual IRC
>> networks. IRC is a great alternative when you're having problems
>> getting your emails seen in the normal email flood.
> That was the first response from him over many submissions. Which
> channels are popular on IRC ?

For your purposes, just get on a network or two, look for the folks you
want to talk to, and join some of the channels they are in.

