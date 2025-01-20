Return-Path: <linux-mips+bounces-7559-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B8CD7A1745F
	for <lists+linux-mips@lfdr.de>; Mon, 20 Jan 2025 22:56:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7FC1E7A3B96
	for <lists+linux-mips@lfdr.de>; Mon, 20 Jan 2025 21:55:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FE271EF092;
	Mon, 20 Jan 2025 21:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EsUaMf97"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16A5823A9;
	Mon, 20 Jan 2025 21:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737410157; cv=none; b=j1MS3iM6IgR6QvRVtnzxvl83SDdKyvMjgGmkfUYAYkuHno+SOP7NrjusqXi12b9F/QhGAk5askm+ZWKSEi/5XToPGeEelExFRO/94doRA0ElQhlqjMWelV9qs13u2AWkVT9o2vkL4TVb53USely1LfzdFw7FGm2Ar33Kyp7fh/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737410157; c=relaxed/simple;
	bh=69VVu6VzykbfRha47TkcjIWnRLGOSO3UtXRheEUR2PQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lGE4mMjLiauBpG675wsnypQg7NSniwEFmKvFUe48eDl8AqM++2dgUAYBhCdbq17HV74Nn86Jsa5UfQipBBdwhTdaHjkPno/6jIy3pziAui5tM6AeQGyBxzcIvOwKUk/yablCZJybo0PGjXzykR4b0XROC3PjQdvbmVjbxLvELbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EsUaMf97; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82914C4CEDD;
	Mon, 20 Jan 2025 21:55:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737410156;
	bh=69VVu6VzykbfRha47TkcjIWnRLGOSO3UtXRheEUR2PQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EsUaMf97jAFv1nRL3KNRyS5BjcZUNm9G/sGdGn0zulnz/myvBUb6ieRKsKb10DkzB
	 QpqZbH6ZBxIq+6USgPxaLCfYmqcT+Dqhf61MP6nbJ7dXyTR3T1e3gPbeyh2tHUsrjT
	 JiRRde6SDBMnqVtN/4UZxX5Bn/896X+XhKSdOpsVHiBkZ/rVvohEUNAII2763t28qb
	 fK2Nd2qxlmSI8qwRCM2lagdEt5uIYVVt8om4fm+LqD2VliQ1oG20xJg9cWghWs2E1p
	 nK7GYwh4rN3yS3oa9RcYPntPQ4F/kAE9q1sHDE+pqS+xcV5D7rsyVA6NdKV+MD/zkS
	 78dGZi85tfhUQ==
Date: Mon, 20 Jan 2025 13:55:54 -0800
From: Kees Cook <kees@kernel.org>
To: Oleg Nesterov <oleg@redhat.com>
Cc: Andy Lutomirski <luto@amacapital.net>, Will Drewry <wad@chromium.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Thomas Gleixner <tglx@linutronix.de>,
	Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 3/4] seccomp: remove the 'sd' argument from
 __secure_computing()
Message-ID: <202501201355.DDA4B6A24@keescook>
References: <20250120134409.GA21241@redhat.com>
 <20250120134459.GA21284@redhat.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250120134459.GA21284@redhat.com>

On Mon, Jan 20, 2025 at 02:44:59PM +0100, Oleg Nesterov wrote:
> After the previous changes 'sd' is always NULL.
> 
> Signed-off-by: Oleg Nesterov <oleg@redhat.com>

Reviewed-by: Kees Cook <kees@kernel.org>

-- 
Kees Cook

