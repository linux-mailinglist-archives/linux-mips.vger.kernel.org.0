Return-Path: <linux-mips+bounces-15488-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 5LmHMfUrSGpUnQAAu9opvQ
	(envelope-from <linux-mips+bounces-15488-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Fri, 03 Jul 2026 23:39:01 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 426AD705EE5
	for <lists+linux-mips@lfdr.de>; Fri, 03 Jul 2026 23:39:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=KtXX8IuU;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15488-lists+linux-mips=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-mips+bounces-15488-lists+linux-mips=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 78446307954C
	for <lists+linux-mips@lfdr.de>; Fri,  3 Jul 2026 21:32:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F050331EA9;
	Fri,  3 Jul 2026 21:32:38 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F56A33E344
	for <linux-mips@vger.kernel.org>; Fri,  3 Jul 2026 21:32:37 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783114358; cv=none; b=n+Y2QEcvQLr+Uu9GfyfeLk0JWfE6CZ4aLdtEfq7fy29wUrMedAYAeYfMdaV1Jzl7cAYYU2ONGU2zADGTO6Z1USSgCtxxj9Xh9IY1nuTrvgdq3WTRTiocZB/sfOjbQkrmyILAIzGM+EHG62z8FgzmSeEypcDnxLa6XVg3qVGTKas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783114358; c=relaxed/simple;
	bh=2Xe0OMXeeYc9/S4+5LxR1blLhyrbF1Lgb0xGUfI7zl4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XPX9YVnWmhTVyH4InPADCiET9PK7cKqAAqFbI88ol52gOSGHJUGR7VEJ6SGMnZ4gE76q+e8M/4YlQRPRHcgTM11P2Pi8+2/ww/fg1yQXMZQLVi+2/dhANoBrxI29nOUhlQkDS218sjAmxbij9xw0rLqdpUTMMZnaOGt9HfnSNAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KtXX8IuU; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D8521F00ADF
	for <linux-mips@vger.kernel.org>; Fri,  3 Jul 2026 21:32:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783114356;
	bh=OKSIV0oOxnrYHCfPO5lAQhnCzHPQePBOMJ0ktW8HRY4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=KtXX8IuUBNhuHWxHxBTjmuPBk9hzOQ7UsQ1CE9gvBu/kMIDFo6Om3uI/27v9fejDF
	 +EVx4yFRcD+ZHGYHSXYVZZrdD4NN/AABtyOquBKTUSIeaFLSvadRobD8UUMhpLHrw0
	 fvkNRGAwgqS7RXxOwI5DWG0GAAfbEfvGiRFksz8erK7uHpTpuZSuWn/tAoEAx/C2WO
	 88OCMIKeQZOVmG2qajorm/8ZVb4ZRZWobPwoWS9swqCLPbGZVB9YV96d8g65sWN148
	 RiD56W+0SQV3jJI86Xxpjs0EONHteMV6QzKzQJsvVBtqNZ2E7uv6VZzpJWrrCp/VUv
	 yBpdVzNcTlwqA==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5aeae350e0aso860529e87.1
        for <linux-mips@vger.kernel.org>; Fri, 03 Jul 2026 14:32:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RosQIDR6rcAiF4yI8Bw4bX453OfJSUxYHxAVjDYczk4QyZveg6h/e5m7yTC9lLcWO4tyOVr0hVQ5/2j@vger.kernel.org
X-Gm-Message-State: AOJu0YzlOLhstyYMiBHEufSKFqNaNtaG26pPoM0IulhDAdp4fudRjGuE
	Vt/ohi/hYFYWrad81kezk/suuxBv/gVoJ5JkLmOs9YU5MDDa4lMoSjstEcnsPWW6ojTgXHyEWCD
	OnZWfvbqj0Mt6YkATIKGjH2iC+0NVdB4=
X-Received: by 2002:a05:6512:8391:b0:5ae:ba2b:b469 with SMTP id
 2adb3069b0e04-5aed5092745mr72984e87.18.1783114353971; Fri, 03 Jul 2026
 14:32:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260629130616.642022-1-ruanjinjie@huawei.com>
 <20260629130616.642022-2-ruanjinjie@huawei.com> <akdp6GAu77-ipsXA@kunlun.suse.cz>
 <87cxx4mmim.ffs@fw13> <akeIK5TRCjlKbzbp@J2N7QTR9R3>
In-Reply-To: <akeIK5TRCjlKbzbp@J2N7QTR9R3>
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 3 Jul 2026 23:32:21 +0200
X-Gmail-Original-Message-ID: <CAD++jLn0Pfhx0bY9XywVkDVU-nyAbvrnf9Wr8TSkuV4hgJL=8w@mail.gmail.com>
X-Gm-Features: AVVi8CegcPVBpxUBhMgaVmjHkjMbMgWpKQVd4voTgZ2p1M7BcZ7lo9TMo7bB8LM
Message-ID: <CAD++jLn0Pfhx0bY9XywVkDVU-nyAbvrnf9Wr8TSkuV4hgJL=8w@mail.gmail.com>
Subject: Re: [PATCH v16 01/18] seccomp: Convert __secure_computing() to return boolean
To: Mark Rutland <mark.rutland@arm.com>
Cc: Thomas Gleixner <tglx@kernel.org>, =?UTF-8?Q?Michal_Such=C3=A1nek?= <msuchanek@suse.de>, 
	Jinjie Ruan <ruanjinjie@huawei.com>, oleg@redhat.com, richard.henderson@linaro.org, 
	mattst88@gmail.com, linmag7@gmail.com, linux@armlinux.org.uk, 
	catalin.marinas@arm.com, will@kernel.org, kees@kernel.org, guoren@kernel.org, 
	chenhuacai@kernel.org, kernel@xen0n.name, geert@linux-m68k.org, 
	tsbogend@alpha.franken.de, James.Bottomley@hansenpartnership.com, 
	deller@gmx.de, maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, 
	chleroy@kernel.org, pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	alex@ghiti.fr, hca@linux.ibm.com, gor@linux.ibm.com, agordeev@linux.ibm.com, 
	borntraeger@linux.ibm.com, svens@linux.ibm.com, ysato@users.sourceforge.jp, 
	dalias@libc.org, glaubitz@physik.fu-berlin.de, richard@nod.at, 
	anton.ivanov@cambridgegreys.com, johannes@sipsolutions.net, luto@kernel.org, 
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, hpa@zytor.com, 
	chris@zankel.net, jcmvbkbc@gmail.com, peterz@infradead.org, wad@chromium.org, 
	thuth@redhat.com, ada.coupriediaz@arm.com, kevin.brodsky@arm.com, 
	yeoreum.yun@arm.com, song@kernel.org, james.morse@arm.com, 
	anshuman.khandual@arm.com, broonie@kernel.org, liqiang01@kylinos.cn, 
	pengcan@kylinos.cn, ryan.roberts@arm.com, yangtiezhu@loongson.cn, 
	sshegde@linux.ibm.com, mchauras@linux.ibm.com, austin.kim@lge.com, 
	jchrist@linux.ibm.com, arnd@arndb.de, thomas.weissschuh@linutronix.de, 
	sohil.mehta@intel.com, andrew.cooper3@citrix.com, jgross@suse.com, 
	kas@kernel.org, x86@kernel.org, linux-alpha@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mm@kvack.org, linux-csky@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-sh@vger.kernel.org, linux-um@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,suse.de,huawei.com,redhat.com,linaro.org,gmail.com,armlinux.org.uk,arm.com,xen0n.name,linux-m68k.org,alpha.franken.de,hansenpartnership.com,gmx.de,linux.ibm.com,ellerman.id.au,dabbelt.com,eecs.berkeley.edu,ghiti.fr,users.sourceforge.jp,libc.org,physik.fu-berlin.de,nod.at,cambridgegreys.com,sipsolutions.net,alien8.de,linux.intel.com,zytor.com,zankel.net,infradead.org,chromium.org,kylinos.cn,loongson.cn,lge.com,arndb.de,linutronix.de,intel.com,citrix.com,suse.com,vger.kernel.org,lists.infradead.org,kvack.org,lists.linux.dev,lists.linux-m68k.org,lists.ozlabs.org];
	TAGGED_FROM(0.00)[bounces-15488-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mark.rutland@arm.com,m:tglx@kernel.org,m:msuchanek@suse.de,m:ruanjinjie@huawei.com,m:oleg@redhat.com,m:richard.henderson@linaro.org,m:mattst88@gmail.com,m:linmag7@gmail.com,m:linux@armlinux.org.uk,m:catalin.marinas@arm.com,m:will@kernel.org,m:kees@kernel.org,m:guoren@kernel.org,m:chenhuacai@kernel.org,m:kernel@xen0n.name,m:geert@linux-m68k.org,m:tsbogend@alpha.franken.de,m:James.Bottomley@hansenpartnership.com,m:deller@gmx.de,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:pjw@kernel.org,m:palmer@dabbelt.com,m:aou@eecs.berkeley.edu,m:alex@ghiti.fr,m:hca@linux.ibm.com,m:gor@linux.ibm.com,m:agordeev@linux.ibm.com,m:borntraeger@linux.ibm.com,m:svens@linux.ibm.com,m:ysato@users.sourceforge.jp,m:dalias@libc.org,m:glaubitz@physik.fu-berlin.de,m:richard@nod.at,m:anton.ivanov@cambridgegreys.com,m:johannes@sipsolutions.net,m:luto@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:hpa@zytor.com,m:chris@z
 ankel.net,m:jcmvbkbc@gmail.com,m:peterz@infradead.org,m:wad@chromium.org,m:thuth@redhat.com,m:ada.coupriediaz@arm.com,m:kevin.brodsky@arm.com,m:yeoreum.yun@arm.com,m:song@kernel.org,m:james.morse@arm.com,m:anshuman.khandual@arm.com,m:broonie@kernel.org,m:liqiang01@kylinos.cn,m:pengcan@kylinos.cn,m:ryan.roberts@arm.com,m:yangtiezhu@loongson.cn,m:sshegde@linux.ibm.com,m:mchauras@linux.ibm.com,m:austin.kim@lge.com,m:jchrist@linux.ibm.com,m:arnd@arndb.de,m:thomas.weissschuh@linutronix.de,m:sohil.mehta@intel.com,m:andrew.cooper3@citrix.com,m:jgross@suse.com,m:kas@kernel.org,m:x86@kernel.org,m:linux-alpha@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-mm@kvack.org,m:linux-csky@vger.kernel.org,m:loongarch@lists.linux.dev,m:linux-m68k@lists.linux-m68k.org,m:linux-mips@vger.kernel.org,m:linux-parisc@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-riscv@lists.infradead.org,m:linux-s390@vger.kernel.org,m:linux-sh@vger.kernel.org,m:linux-um
 @lists.infradead.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[linusw@kernel.org,linux-mips@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linusw@kernel.org,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_GT_50(0.00)[84];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,arm.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 426AD705EE5

On Fri, Jul 3, 2026 at 12:00=E2=80=AFPM Mark Rutland <mark.rutland@arm.com>=
 wrote:

> Bikeshedding below; sorry.
>
> I think the bigger problem is just that secure_computing() is a terrible
> name that does not express the intended semantic -- it's not clear
> whether "secure computing" means "seccomp permit the syscall" or
> "seccomp is enabled and some special rules now apply" or something else
> entirely.
>
> If we're changing the return type, it might be worth renaming the
> function something like:
>
>         seccomp_permits_syscall()

Yeah that's way better, let's do this.
(I also had problems with this function!!)

Rusty Russel's API design manifesto tells us to do this:
https://gist.github.com/mjball/9cd028ac793ae8b351df1379f1e721f9

Yours,
Linus Walleij

