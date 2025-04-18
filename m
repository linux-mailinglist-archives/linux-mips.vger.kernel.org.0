Return-Path: <linux-mips+bounces-8651-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 817E0A935C7
	for <lists+linux-mips@lfdr.de>; Fri, 18 Apr 2025 12:06:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CA19A3B007A
	for <lists+linux-mips@lfdr.de>; Fri, 18 Apr 2025 10:06:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CBDB253F00;
	Fri, 18 Apr 2025 10:06:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="sQV/u+jV"
X-Original-To: linux-mips@vger.kernel.org
Received: from out-181.mta0.migadu.com (out-181.mta0.migadu.com [91.218.175.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B976519D074
	for <linux-mips@vger.kernel.org>; Fri, 18 Apr 2025 10:06:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744970797; cv=none; b=aJDKsP0q23BVicGqpDO5tHHPGxc1LM3WInuTPqrk5Rz5v4x+p73x/xAHKOReKXcqYq5zCboZD00+zrTCEHfxTjjAuPk/fTyCy8fphJ2h6kBEUnAncb1IDM7eNkEmhz0uHOsSBplsE0um6/vxR5scuuBKcDMBDZWvEy2UeVwstXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744970797; c=relaxed/simple;
	bh=sqneE/YMjA/pyVVbycpzttNUKQsyesmIU7FKiP4qcz0=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=nBU3I4/gUqdCZ9lr/LmzCpH8+418wYuxNDQFJf3KKoqWLwjRaZUpVQN7aOSvZi9766boJBTMQ6Ral4m7LmvB1ADSjZdvbM8FdZb5vZTxl1nSk+Z2A1qtEau8+LHbKH0qpHXxZKCtXcLOPzrfWT02J5IUIE15Jv/Qc9xDmwoiKx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=sQV/u+jV; arc=none smtp.client-ip=91.218.175.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Content-Type: text/plain;
	charset=us-ascii
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1744970791;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sqneE/YMjA/pyVVbycpzttNUKQsyesmIU7FKiP4qcz0=;
	b=sQV/u+jVRB+rp5So9kwTxElco0blrhF+ROpvv0VCcxheTE6X3VU+bBOB0XdpJX4lZ3+Z3R
	uydQjy/rRDSq3NTMQ+gGrQ0/qVN2ZGY9ZuI8xSlS0wwb5+1dwFpiQ44BdA1E4NJPnGSIAu
	wTPyrk5fYBGTD6sQ3RlFV9Zi1r1U/LY=
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3776.700.51.11.2\))
Subject: Re: [PATCH v2] MIPS: Fix MAX_REG_OFFSET and remove zero-length struct
 member
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Thorsten Blum <thorsten.blum@linux.dev>
In-Reply-To: <aAIF_kEFlOOVNDaE@alpha.franken.de>
Date: Fri, 18 Apr 2025 12:06:18 +0200
Cc: Oleg Nesterov <oleg@redhat.com>,
 "Maciej W. Rozycki" <macro@orcam.me.uk>,
 linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <DAD22E95-6D33-43D5-B5E5-3A7B45A63944@linux.dev>
References: <20250417174712.69292-2-thorsten.blum@linux.dev>
 <aAIF_kEFlOOVNDaE@alpha.franken.de>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
X-Migadu-Flow: FLOW_OUT

On 18. Apr 2025, at 09:57, Thomas Bogendoerfer wrote:
> On Thu, Apr 17, 2025 at 07:47:13PM +0200, Thorsten Blum wrote:
>> Remove the unnecessary zero-length struct member '__last' and fix
>> MAX_REG_OFFSET to point to the last register in 'pt_regs'.
>>=20
>> Fixes: 40e084a506eba ("MIPS: Add uprobes support.")
>=20
> what does it fix ?

The value of MAX_REG_OFFSET and thus how regs_get_register() behaves.

=46rom my understanding, MAX_REG_OFFSET points to the marker '__last[0]'
instead of the actual last register in 'pt_regs', which could allow
regs_get_register() to return an invalid offset.

Let me know if I'm missing anything.

Thanks,
Thorsten


