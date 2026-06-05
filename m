Return-Path: <linux-mips+bounces-14916-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id DHLwAw9/ImooYwEAu9opvQ
	(envelope-from <linux-mips+bounces-14916-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Fri, 05 Jun 2026 09:47:27 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 716926461D3
	for <lists+linux-mips@lfdr.de>; Fri, 05 Jun 2026 09:47:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-14916-lists+linux-mips=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-mips+bounces-14916-lists+linux-mips=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 73601304B139
	for <lists+linux-mips@lfdr.de>; Fri,  5 Jun 2026 07:30:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 288BA47AF6C;
	Fri,  5 Jun 2026 07:30:50 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D6264657D7
	for <linux-mips@vger.kernel.org>; Fri,  5 Jun 2026 07:30:48 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780644650; cv=none; b=CnyfgFLRbF0eTZ1HDd0VJ3xenIhym7gSUYJ5F6cpCKzVnDeATqKIWQwAlWldDa/rhi4RQRbTYmEtEeDUlNHx9Ns9zsvn6cN+I6rdSfJxmWy10Jnp22T0+KeMarUZ2x1A6qxRpGqrbxOZ5mrfirwkdZLl+IxotcXaUNCwe/HeAR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780644650; c=relaxed/simple;
	bh=5W/tWie+s0GyiFfiVzYnA5c+lJxiUZ1i+gzNpq+8JKc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Gzxfdwel6aPd59pXE8KpiGAaeYnX7XsTNfpLhm6KGYgd2zAmZ/KPCdIEl+SWVsXGsJ63lfB3DK6wCyIrobd1dFIvngO8i36IWVeC762axQ38rIEqJtjFyld3jM7rLGYQwVmOQRWO2c0AXQ1ssmrUUDScUJP3UOM6jpd6nR7veoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.172
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-59d07df448bso1295323e0c.0
        for <linux-mips@vger.kernel.org>; Fri, 05 Jun 2026 00:30:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780644648; x=1781249448;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JJPTFXFfEVfaClOO5icEXfzsJcEhxZLVJwj7hX3l3SM=;
        b=Z6Ho5Rw9RaQBwFvdceFYhk78SkTLUBYrdIFtM37u5fF0R6ZYjVQBNGGzF9Z2ENebNF
         Dzb3eBw5CF/h59Ix7siIdgCYkOMF8kYsleiMNVF0nbxwH5cipsr3lubKi9ZCXg16paj6
         cmQ5xgtpTRDPWJSvMP7+izFOIdxbFFRTa1LfzF3W28BvXZ4mnWmLwGN+DHbD1o+ir5Ey
         W2Je53PMq7pTAhk8QBK4Yf29a2QUcbG+9ve2tdN4VVOBK1yyPzYg5WVZXukHygHBRE7N
         YqmYZBPExWZYdJKvXtngKN2wHdcehDceN8eKWVlGJhpq4jdwEuzK5EEpNhB1rVEe+iP7
         OzZg==
X-Forwarded-Encrypted: i=1; AFNElJ/M1mT1Qchrpu8WS0JcmQiI+FDG/BBS8jzwwreFbKYTeJVdBXLykA2yU504EQcY/wbESOij9ZL+5S9U@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4oPCXxBEpGYCFPD2JjjRLBVPTgA6tVj/T5/t4uhXMI7UICHt2
	64/gUub+piulwVH8zzipbZlSADqhmm4j3jH6jxesx/5pg3nE674s1WBMVC2pHL0mmGI=
X-Gm-Gg: Acq92OGH3eXt3m5f6dAh+Lm9MzxFZOt0l+ifxKREvvEmiL8wdxRq4g/WH9V2XCUz657
	A/+WjfbG4bT3X6zvFGk6u5cW70C1IvaCB8uY4uVj0m3NlQ+qHESQq6VZ1PKe8zRv9QVbKRR5GQ7
	Vdih0Gr92dF2naEe8my8QjMM69bPFzNgMCaHz55d4hR4PIs5ALJCehcPYbAuADwESP0lbisa5KS
	38sLL2CTgehDj5kt0HOkSBZwADQsPbBWYQu361cqX6KroaiM0KgbtSCMxaIOJYvJ8w6x2taPHg2
	p0cS9FzotqdBXI8OY6Npmo1IRfLGi2jgnb7Pwe5rnqiIg/12fVEFxbPNRrUCm/HfoeoqStX8ifz
	BNIvf7omgfYVbt/d1kCS13BLJ2UgJZm9yHp1ar27pQVys7kxrcHkNHcBgvL/sJhbO0OhT8FhrPT
	ER1xqnNEHBz+M1C4Ub2Yah6Z/2lR+u6KZuwwGEA7mWl0IK9ANB2owslnDDsh/0dTgXG+ySBQQ=
X-Received: by 2002:a05:6122:e14e:b0:5a0:3d17:f939 with SMTP id 71dfb90a1353d-5ac5291a586mr1116285e0c.9.1780644647677;
        Fri, 05 Jun 2026 00:30:47 -0700 (PDT)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com. [209.85.222.43])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5a6dd501a90sm7150741e0c.17.2026.06.05.00.30.46
        for <linux-mips@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Jun 2026 00:30:46 -0700 (PDT)
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-963a722ed58so1044334241.0
        for <linux-mips@vger.kernel.org>; Fri, 05 Jun 2026 00:30:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9jJd2alsnEXUWNqjWLmS8ETua8FT9tmyBMGjlJp5cRv1FZOi2xxPsz0O/0PlMgFdwKZ/YqSGV/V6cN@vger.kernel.org
X-Received: by 2002:a05:6102:cc8:b0:62f:3abe:907f with SMTP id
 ada2fe7eead31-6feed1adbffmr1189675137.4.1780644646130; Fri, 05 Jun 2026
 00:30:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260604-remove-pktcdvd-references-v3-0-e2f06fb4eef4@gmail.com>
 <20260604-remove-pktcdvd-references-v3-1-e2f06fb4eef4@gmail.com> <88d9bb41-e51d-4b71-a6d9-f1b79eccd496@acm.org>
In-Reply-To: <88d9bb41-e51d-4b71-a6d9-f1b79eccd496@acm.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 5 Jun 2026 09:30:35 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVhjYBhKUPzx-FAKWAAkUwcpYh0v2V5w64OMJtREZr4PQ@mail.gmail.com>
X-Gm-Features: AVVi8CdzPUN0PjO13sCwZaAxIjLcvwA5tXzyJ1zGjjn5YbgvhAb6LM_UbfPQhv4
Message-ID: <CAMuHMdVhjYBhKUPzx-FAKWAAkUwcpYh0v2V5w64OMJtREZr4PQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/6] scsi: core: Remove remaining reference to the
 pktcdvd driver
To: Bart Van Assche <bvanassche@acm.org>
Cc: Catalin Iacob <iacobcatalin@gmail.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Rich Felker <dalias@libc.org>, 
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, "David S. Miller" <davem@davemloft.net>, 
	Andreas Larsson <andreas@gaisler.com>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
	"Martin K. Petersen" <martin.petersen@oracle.com>, Jens Axboe <axboe@kernel.dk>, 
	Yoshinori Sato <ysato@users.sourceforge.jp>, linux-mips@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-scsi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-14916-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:bvanassche@acm.org,m:iacobcatalin@gmail.com,m:tsbogend@alpha.franken.de,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:dalias@libc.org,m:glaubitz@physik.fu-berlin.de,m:davem@davemloft.net,m:andreas@gaisler.com,m:James.Bottomley@hansenpartnership.com,m:martin.petersen@oracle.com,m:axboe@kernel.dk,m:ysato@users.sourceforge.jp,m:linux-mips@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-sh@vger.kernel.org,m:sparclinux@vger.kernel.org,m:linux-scsi@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[geert@linux-m68k.org,linux-mips@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[21];
	FREEMAIL_CC(0.00)[gmail.com,alpha.franken.de,linux.ibm.com,ellerman.id.au,kernel.org,libc.org,physik.fu-berlin.de,davemloft.net,gaisler.com,hansenpartnership.com,oracle.com,kernel.dk,users.sourceforge.jp,vger.kernel.org,lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	R_DKIM_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,acm.org:email,vger.kernel.org:from_smtp,linux-m68k.org:from_mime,linux-m68k.org:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 716926461D3

Hoi Bart,

On Thu, 4 Jun 2026 at 18:01, Bart Van Assche <bvanassche@acm.org> wrote:
> On 6/4/26 6:20 AM, Catalin Iacob wrote:
> > Commit 1cea5180f2f8 ("block: remove pktcdvd driver") left behind an
> > export that is now dead code. Remove it.
> The subject should say something like "Unexport
> scsi_device_from_queue()".

<pedantic>
But that is not what it does: the symbol is never exported, as
CONFIG_CDROM_PKTCDVD_MODULE can never be set?
</pedantic>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

