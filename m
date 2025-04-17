Return-Path: <linux-mips+bounces-8616-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 902CDA9162E
	for <lists+linux-mips@lfdr.de>; Thu, 17 Apr 2025 10:09:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 27ED11908462
	for <lists+linux-mips@lfdr.de>; Thu, 17 Apr 2025 08:10:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FA9722D7BE;
	Thu, 17 Apr 2025 08:09:50 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EF66225785;
	Thu, 17 Apr 2025 08:09:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.133.224.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744877390; cv=none; b=oFLW/eQywkK0ItWKryaVNlVrSY0DLr0HBn4QsoyAPodm7dH3JI3Hx/sPjLlzSSFgDrWKWyb5YWukv7WgUWCuyBBk6vgdc0T+K4+QSjF0fLuDzAsOXRn5UQur0OYZSqFeK1woo91tFVTUp5v5cK+QwXrT29Vuhg8Tva066HquGeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744877390; c=relaxed/simple;
	bh=zWpOF/YhpoH5ssaekuFbX/l747SUx4PLqiY2O3pBLPk=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=usfv3rh4pqbUi2/1xfNkTscXgWM0KZdCHYb24TiM92UIVvx3AcxgJuNqd0LwrlveR7I9EB/vt7G677StA49zG1vhExziuzzk5AwkYHB//qXm2Uqmrm9hS5n2eZHBVde6DIZFSjQ/rCvRwLwWUK0yklIVve2jlYHrJX0dURw4Ako=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none smtp.mailfrom=orcam.me.uk; arc=none smtp.client-ip=78.133.224.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=orcam.me.uk
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 51D5092009C; Thu, 17 Apr 2025 10:09:39 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 4F5C492009B;
	Thu, 17 Apr 2025 09:09:39 +0100 (BST)
Date: Thu, 17 Apr 2025 09:09:39 +0100 (BST)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Thorsten Blum <thorsten.blum@linux.dev>
cc: Oleg Nesterov <oleg@redhat.com>, 
    Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
    linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MIPS: Remove unnecessary zero-length struct member
In-Reply-To: <03F0731F-3C87-47D9-A739-01289873572B@linux.dev>
Message-ID: <alpine.DEB.2.21.2504170903020.18253@angie.orcam.me.uk>
References: <20250411090032.7844-1-thorsten.blum@linux.dev> <alpine.DEB.2.21.2504160321210.23090@angie.orcam.me.uk> <03F0731F-3C87-47D9-A739-01289873572B@linux.dev>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 17 Apr 2025, Thorsten Blum wrote:

> > Also this is broken anyway: if you use MAX_REG_OFFSET for `offset' passed 
> > to `regs_get_register', then data past the end of `regs' will be accessed.
> 
> Yes, true. It seems like
> 
> 	if (unlikely(offset >= MAX_REG_OFFSET))
> 		return 0;
> 
> should do the trick.

 No, other platforms use the same (offset > MAX_REG_OFFSET) check that we 
do and just set MAX_REG_OFFSET correctly to point at the last register in 
`struct pt_regs'.

> The comment also says "If @offset is bigger than MAX_REG_OFFSET", rather
> than "is bigger than or equal to".

 And quite correctly so.

> Happy to add it to v2 or a separate patch, if this is actually correct?!

 Yes, please send v2.  There's no point in changing MAX_REG_OFFSET twice.

  Maciej

