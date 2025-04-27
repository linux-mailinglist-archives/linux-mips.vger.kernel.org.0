Return-Path: <linux-mips+bounces-8811-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 26649A9E314
	for <lists+linux-mips@lfdr.de>; Sun, 27 Apr 2025 14:52:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B3AC77A55A9
	for <lists+linux-mips@lfdr.de>; Sun, 27 Apr 2025 12:51:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A66878C0E;
	Sun, 27 Apr 2025 12:52:09 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F9A7610C;
	Sun, 27 Apr 2025 12:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.175.24.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745758329; cv=none; b=Lot/MKUrM1vWjFA+xQ0VAHDJliA6UV4wRj2MSB7T9L2o+ANA3bP3lmvtmz845NGAUeqSgckEmMSpQKTilEFu0esjf7PPo9ql1j+3bfFobR7Z5QfKQ8g/zFuoiFjgDpF0mAddISAfWh48Iarfc9FUoaAbyrUqs0OsHpsz8C869yM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745758329; c=relaxed/simple;
	bh=6cEZKR3sZKuXHUIDeK4kcLFUsoi8b21G0ldm2TLtdWw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BQN9PJvFSD134XlHfkvpq11vzdGAgtgYfjPuB1SKLY/Jo2QNphG5EEB91HXWwBMxlpIREhmC0mNftKV5uZk3EvNAFJhJFWmfm/ZDAB5ILMWE544N/+ZSKi3/TeHN+dh/JTDb/FCxd+ph/HfIeo7hTExsL0sXa7j1nb+XqVKkAg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de; spf=pass smtp.mailfrom=alpha.franken.de; arc=none smtp.client-ip=193.175.24.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=alpha.franken.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alpha.franken.de
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
	id 1u91UK-0000ST-00; Sun, 27 Apr 2025 14:52:04 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 7CAA9C01A2; Sun, 27 Apr 2025 14:51:54 +0200 (CEST)
Date: Sun, 27 Apr 2025 14:51:54 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	Oleg Nesterov <oleg@redhat.com>,
	"Maciej W. Rozycki" <macro@orcam.me.uk>, linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] MIPS: Fix MAX_REG_OFFSET
Message-ID: <aA4oag9MAXT3y0t8@alpha.franken.de>
References: <20250427113423.67040-2-thorsten.blum@linux.dev>
 <CAAhV-H6kxy9NaWXqq1QLfobVvVz9-VMybHC6M+0V-sE3MY9SRA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAAhV-H6kxy9NaWXqq1QLfobVvVz9-VMybHC6M+0V-sE3MY9SRA@mail.gmail.com>

On Sun, Apr 27, 2025 at 08:32:05PM +0800, Huacai Chen wrote:
> Hi, Thorsten,
> 
> On Sun, Apr 27, 2025 at 7:35 PM Thorsten Blum <thorsten.blum@linux.dev> wrote:
> >
> > Fix MAX_REG_OFFSET to point to the last register in 'pt_regs' and not to
> > the marker itself, which could allow regs_get_register() to return an
> > invalid offset.
> >
> > Fixes: 40e084a506eb ("MIPS: Add uprobes support.")
> > Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> > ---
> > Compile-tested only.
> >
> > Changes in v2:
> > - Fix MAX_REG_OFFSET as suggested by Maciej (thanks!)
> > - Link to v1: https://lore.kernel.org/lkml/20250411090032.7844-1-thorsten.blum@linux.dev/
> >
> > Changes in v3:
> > - Keep the marker and avoid using #ifdef by adjusting MAX_REG_OFFSET as
> >   suggested by Thomas and Maciej
> > - Link to v2: https://lore.kernel.org/lkml/20250417174712.69292-2-thorsten.blum@linux.dev/
> > ---
> >  arch/mips/include/asm/ptrace.h | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/arch/mips/include/asm/ptrace.h b/arch/mips/include/asm/ptrace.h
> > index 85fa9962266a..ef72c46b5568 100644
> > --- a/arch/mips/include/asm/ptrace.h
> > +++ b/arch/mips/include/asm/ptrace.h
> > @@ -65,7 +65,8 @@ static inline void instruction_pointer_set(struct pt_regs *regs,
> >
> >  /* Query offset/name of register from its name/offset */
> >  extern int regs_query_register_offset(const char *name);
> > -#define MAX_REG_OFFSET (offsetof(struct pt_regs, __last))
> > +#define MAX_REG_OFFSET \
> > +       (offsetof(struct pt_regs, __last) - sizeof(unsigned long))
> There is no 80 columns limit now, so no new line needed here.

but not forbidden to care about it. I still prefer this limit.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

