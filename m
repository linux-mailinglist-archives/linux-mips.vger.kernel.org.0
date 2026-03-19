Return-Path: <linux-mips+bounces-13790-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wKewLTg1vGl3uwIAu9opvQ
	(envelope-from <linux-mips+bounces-13790-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Thu, 19 Mar 2026 18:41:12 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 71FE42D027A
	for <lists+linux-mips@lfdr.de>; Thu, 19 Mar 2026 18:41:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D19B130501A0
	for <lists+linux-mips@lfdr.de>; Thu, 19 Mar 2026 17:39:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C869A396B73;
	Thu, 19 Mar 2026 17:38:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AwsdLrRj"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 078A43939A0;
	Thu, 19 Mar 2026 17:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773941937; cv=none; b=eIdenEEy9wQZLgMkp7l1L18+dqAtSvFRfX0TB0Pt2Lr5ku0QDWX97Lmx4/XG386pWpl3iiVR6uCwzGvx8Drf7eeqwtWgpay80qPIbDZB/XalfuxQeBrynmtXG0rq4xUgkIWMYT6D1WyBOERh9BXKtapLYJYv44qzJo20ijQmkt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773941937; c=relaxed/simple;
	bh=Hivr+4pDKuDtiIkYu2gbJDWvORBSel+6FMp1v9HmeG4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dRkFliSpUbASlzX1rLjhnMXABibi9VPIc91foVuMXibeCfjFaiqCu1etvIZg1WS80QX9+aO9d1vzLD/Aw/4LnVL6EgZObwgEuAdEa0ZnO8SiXrgJTgrK0jOyc/gx02E7AHn6isNGcSfyPBP8xQ1xBjlBn+QmmEESuRyeF8l4pV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AwsdLrRj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 179C3C19425;
	Thu, 19 Mar 2026 17:38:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773941936;
	bh=Hivr+4pDKuDtiIkYu2gbJDWvORBSel+6FMp1v9HmeG4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=AwsdLrRji7S/5bKRIRoLy9oMGfPTq7CI03hWA5bepga8vECo4/3RvNVeYeizQKIwW
	 R9UN16H8ZaF5yK8yAVtizkZh9zEgm8LSZqWA/t1UeGp3EhNubKGLgbwTBmjS9ANHPQ
	 CKr7ivIecBornjtAgZMvvL1T+6+bs5ktKzdaTNRhc0LyaeH1C0j44VGifmhwvaAXJM
	 POmn8ELyxElL1bT/10KjExBS16LBEqK+xysiliEZ0LVwQMpB+qDKVPe4l/rYse1i4L
	 PzUuZBXSFeyQ5M9ynh9jcooBzTBMkDLSF06baAlOeNctRGjpEyjMmt7dSbkQmkwwU3
	 AvDqZkxp71zew==
Message-ID: <b5f6f86a-3321-46ee-a481-23c2ee219618@kernel.org>
Date: Thu, 19 Mar 2026 18:38:43 +0100
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 11/23] mm/vma: introduce
 [vma_flags,legacy]_to_[legacy,vma_flags]() helpers
Content-Language: en-US
To: "Lorenzo Stoakes (Oracle)" <ljs@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: David Hildenbrand <david@kernel.org>,
 "Liam R . Howlett" <Liam.Howlett@oracle.com>, Jann Horn <jannh@google.com>,
 Pedro Falcato <pfalcato@suse.de>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Kees Cook <kees@kernel.org>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 Vineet Gupta <vgupta@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Brian Cain <bcain@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
 WANG Xuerui <kernel@xen0n.name>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Dinh Nguyen <dinguyen@kernel.org>, Madhavan Srinivasan
 <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <chleroy@kernel.org>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>, Thomas Gleixner <tglx@kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H . Peter Anvin" <hpa@zytor.com>, Richard Weinberger <richard@nod.at>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Johannes Berg <johannes@sipsolutions.net>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 Xu Xin <xu.xin16@zte.com.cn>, Chengming Zhou <chengming.zhou@linux.dev>,
 Michal Hocko <mhocko@suse.com>, Paul Moore <paul@paul-moore.com>,
 Stephen Smalley <stephen.smalley.work@gmail.com>,
 Ondrej Mosnacek <omosnace@redhat.com>, linux-snps-arc@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-hexagon@vger.kernel.org,
 loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-um@lists.infradead.org,
 linux-fsdevel@vger.kernel.org, selinux@vger.kernel.org
References: <cover.1773846935.git.ljs@kernel.org>
 <4fdffd05ee7fabe2dc313850a4300bf184beba69.1773846935.git.ljs@kernel.org>
From: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
In-Reply-To: <4fdffd05ee7fabe2dc313850a4300bf184beba69.1773846935.git.ljs@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,oracle.com,google.com,suse.de,kvack.org,vger.kernel.org,armlinux.org.uk,arm.com,xen0n.name,alpha.franken.de,linux.ibm.com,ellerman.id.au,gmail.com,dabbelt.com,eecs.berkeley.edu,ghiti.fr,redhat.com,alien8.de,linux.intel.com,zytor.com,nod.at,cambridgegreys.com,sipsolutions.net,zeniv.linux.org.uk,suse.cz,zte.com.cn,linux.dev,suse.com,paul-moore.com,lists.infradead.org,lists.linux.dev,lists.ozlabs.org];
	TAGGED_FROM(0.00)[bounces-13790-lists,linux-mips=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_GT_50(0.00)[62];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vbabka@kernel.org,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.995];
	TAGGED_RCPT(0.00)[linux-mips];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 71FE42D027A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/18/26 16:50, Lorenzo Stoakes (Oracle) wrote:
> While we are still converting VMA flags from vma_flags_t to vm_flags_t,
> introduce helpers to convert between the two to allow for iterative
> development without having to 'change the world' in a single commit'.
> 
> Also update VMA flags tests to reflect the change.
> 
> Finally, refresh vma_flags_overwrite_word(),
> vma_flag_overwrite_word_once(), vma_flags_set_word() and
> vma_flags_clear_word() in the VMA tests to reflect current kernel
> implementations - this should make no functional difference, but keeps the
> logic consistent between the two.
> 
> Signed-off-by: Lorenzo Stoakes (Oracle) <ljs@kernel.org>

Acked-by: Vlastimil Babka (SUSE) <vbabka@kernel.org>


