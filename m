Return-Path: <linux-mips+bounces-15914-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id sK5FJMs9V2rhHwEAu9opvQ
	(envelope-from <linux-mips+bounces-15914-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Wed, 15 Jul 2026 09:59:07 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 86C9275BAB9
	for <lists+linux-mips@lfdr.de>; Wed, 15 Jul 2026 09:59:06 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15914-lists+linux-mips=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-mips+bounces-15914-lists+linux-mips=lfdr.de@vger.kernel.org";
	dmarc=none;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8D69E300404B
	for <lists+linux-mips@lfdr.de>; Wed, 15 Jul 2026 07:58:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F5673C3782;
	Wed, 15 Jul 2026 07:58:37 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFD653112DA
	for <linux-mips@vger.kernel.org>; Wed, 15 Jul 2026 07:58:35 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784102317; cv=none; b=jrAIwEmRdzDTm9s6oPTomXAFDOvDOPg1gHOW/C3ZZk8PK0GKc0Ijo0K8pHINTVLwWy90UfllwnAe/WdGY9BPTiFl7fR/7brSd4RCSnTnKvXofU6ZKU6OoS3bMMB9TgApGDeqy8At968NtX8ubHgacQrDcr5hhsgwpZgEadN+z9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784102317; c=relaxed/simple;
	bh=u8cicfkmRrJrH6XZK18EpfmqX98dxO0lsa0zsnA4eZE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ULLccTxdj+ht2DidVoC6SoTrm9W5Mo5qU9f/jhScTB4g/FM1iNfTEbdCrBLk83GDysCL80HZJA3Rj6QAkO5FlgOhSqujQjpzH6pod0taNBRlMqFdlg42UHSWyyamC0tKQdqz7cxN2DkazbfSKh3hd/623T5D0KqBphtM1T6xxT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.214.178
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2cad4170e8eso63602505ad.3
        for <linux-mips@vger.kernel.org>; Wed, 15 Jul 2026 00:58:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784102315; x=1784707115;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hqKDqOfd26TqLmXrf6Sno+8+vAQxzNMwBOFafeUJRw4=;
        b=KC5qUmiV04I2alBvnWoDsOPJGu55RYHuWndz0Qd1KTUzh0LLM+dvxbQZo/iw2PlxiX
         dXCa/OcP8e1UCoSD6MdWMQ/cPLNSHT+dsrgcxq7zYCwv3OtiwELcXsJUuxoVagTbVR7I
         l0+UksxrbiEKYGIPvBOPkPgbHAAZGnNJAf9JxRoQ3rxQ0UyrEVSb7dAi0hL2TGuSj8KI
         qQEMtV+H5N5esJUTLSJW0Ke5ernTQ6eRwufqxaSkYMxuGLwqda1s9KViBb+4nuN6XyWA
         pfmfhsMXPjBxSAosDtPvr8CMvqyvohYmUooucpMRGru6i3LGYHf6dwZ3dhV6bhAp4kl5
         I1RA==
X-Forwarded-Encrypted: i=1; AHgh+Rp0AwpP5lg8CHQfFi+MjVGm8UXNxxULGdNsgqyP4aen7ciDlbUQ1CO/3ZVBkRFH+EZa1gbL+0x0SjqB@vger.kernel.org
X-Gm-Message-State: AOJu0Yxwcn0zBVnuXFNEQxcWqmUlXoaclZUML++4VHl1VIR58viPabzY
	yblEX+YsI5BDRarRatjv3etYYAnzIHpsHDKoU6IG7rl3J6bP+FsJO7gemFP2eowVpcg=
X-Gm-Gg: AfdE7ckhBj0HvRPLxyGD/N06oZPDJTHnk9iQawhRIwtgKeUK8UW+40KuqLQDDHsgbvN
	8cTypMtpmSJ8nSbnQxOfLcbJL6j0/vM8IgS4tNoV6igcNyqhpeldgXRnocEIof4bea0PSF0chY4
	Zd8/ekL2OmRZbai6xkK6Gby2Kahtvc7+cGbCzDFSFqp8NP9LISy3KXlRa4EChlSS4xyeugu5iLh
	GPjXbGUd7hHMKNJxBmBN6BZdFj0rZO5Y36Kvf9yoAlE/ZucjXDr74Onvrh1kvQ/gCNjAtjoX2UA
	fRB3G3H3L3uH3q3d/l2w0rJNJOAyYAlq7SWwEFmOZU5zZ1s4GwfQuaIOIUWdtYjlBIzVwg+RGma
	cf6PID0fnL9fqhmRSad1QHPYdsse0JjW+gg5AbfWjnudDlZSe5idCX1YZKSOkeRfhTmeSOriW7/
	UvEtkWNBoq+LJJJ+tlyhpReC069FX+iZutjafJx3xjPJQ1WekAfpx4EQ==
X-Received: by 2002:a05:690e:458a:20b0:667:5e15:5728 with SMTP id 956f58d0204a3-66807717d51mr2758277d50.28.1784101907957;
        Wed, 15 Jul 2026 00:51:47 -0700 (PDT)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com. [209.85.128.182])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-667877a2db1sm18366131d50.6.2026.07.15.00.51.47
        for <linux-mips@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jul 2026 00:51:47 -0700 (PDT)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-81e9f7491ffso55548537b3.0
        for <linux-mips@vger.kernel.org>; Wed, 15 Jul 2026 00:51:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrgVRfdyCRZm5k56SASXXRE5hUedCcmAd/m38hJFVxC4bkWYroIipajrhcNHxlZbBYwjRgyz7XqsMgT@vger.kernel.org
X-Received: by 2002:a05:6102:6891:b0:73e:9fae:584c with SMTP id
 ada2fe7eead31-745875199aemr2922337137.19.1784101517020; Wed, 15 Jul 2026
 00:45:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <6007625e-c3f9-4ad6-99a8-61396bccbcec@kernel.org>
 <32d459d1-ad19-4baf-bbb1-0565458001d2@intel.com> <3ea30f8a-bb29-4bf5-8400-1c4840d46a88@kernel.org>
 <7e84b200-25eb-43a6-b5e2-5f27f2d82a77@intel.com> <31988089-095a-4eed-b5e2-c677c70f79f6@kernel.org>
 <14e250db-1641-4085-8d13-02f819657d5f@intel.com> <d83c76b3-ea4d-4c41-b4c5-f5ae558ace55@kernel.org>
 <alYgMxKqRnF6_X0A@e129823.arm.com> <6df814c9-405c-48d8-96ea-929c4b28949b@intel.com>
 <alZe-Cu7yQw9qRXU@e129823.arm.com> <alZo9feSrSB_StfO@e129823.arm.com>
In-Reply-To: <alZo9feSrSB_StfO@e129823.arm.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 15 Jul 2026 09:45:05 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUqL=vJFAzYgcRVNbD_VWWwhehwTuhTfwLt_yRR8c+B0g@mail.gmail.com>
X-Gm-Features: AUfX_mwGugbyQZ1JX8fgK_JNKs5rGnucGlnBlUaIc_V2N3HkDTrdgggdZ_cY0do
Message-ID: <CAMuHMdUqL=vJFAzYgcRVNbD_VWWwhehwTuhTfwLt_yRR8c+B0g@mail.gmail.com>
Subject: Re: [RFC PATCH 10/34] x86: mm: carve out the generic compile-time
 folded pgtable case in effective_prot()
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: Dave Hansen <dave.hansen@intel.com>, "David Hildenbrand (Arm)" <david@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linux-arch@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, x86@kernel.org, linux-mm@kvack.org, 
	kasan-dev@googlegroups.com, linux-csky@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linux-openrisc@vger.kernel.org, 
	linux@armlinux.org.uk, akpm@linux-foundation.org, ankur.a.arora@oracle.com, 
	rppt@kernel.org, linmag7@gmail.com, chleroy@kernel.org, klarasmodin@gmail.com, 
	chenhuacai@kernel.org, kernel@xen0n.name, kas@kernel.org, 
	zhangtianyang@loongson.cn, wangyuli@aosc.io, tsbogend@alpha.franken.de, 
	ljs@kernel.org, jgg@ziepe.ca, catalin.marinas@arm.com, will@kernel.org, 
	arnd@arndb.de, ryan.roberts@arm.com, pasha.tatashin@soleen.com, 
	rmclure@linux.ibm.com, baolin.wang@linux.alibaba.com, tj@kernel.org, 
	kevin.brodsky@arm.com, anup@brainfault.org, atish.patra@linux.dev, 
	pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	dave.hansen@linux.intel.com, luto@kernel.org, peterz@infradead.org, 
	tglx@kernel.org, mingo@redhat.com, bp@alien8.de, hpa@zytor.com, 
	hannes@cmpxchg.org, mhocko@kernel.org, qi.zheng@linux.dev, 
	shakeel.butt@linux.dev, kasong@tencent.com, baohua@kernel.org, 
	axelrasmussen@google.com, yuanchu@google.com, weixugc@google.com, 
	ryabinin.a.a@gmail.com, glider@google.com, andreyknvl@gmail.com, 
	dvyukov@google.com, vincenzo.frascino@arm.com, anshuman.khandual@arm.com, 
	yang@os.amperecomputing.com, chaitanyas.prakash@arm.com, ardb@kernel.org, 
	guoren@kernel.org, yang.li85200@gmail.com, viro@zeniv.linux.org.uk, 
	dinguyen@kernel.org, schuster.simon@siemens-energy.com, 
	wangruikang@iscas.ac.cn, junhui.liu@pigmoral.tech, muchun.song@linux.dev, 
	vishal.moola@gmail.com, namcao@linutronix.de, pavel@kernel.org, 
	djbw@kernel.org, yu-cheng.yu@intel.com, baolu.lu@linux.intel.com, 
	Jonathan.Cameron@huawei.com, coxu@redhat.com, andreas@gaisler.com, 
	liam@infradead.org, vbabka@kernel.org, surenb@google.com, mhocko@suse.com, 
	shorne@gmail.com, jonas@southpole.se, stefan.kristiansson@saunalahti.fi
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-15914-lists,linux-mips=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[intel.com,kernel.org,lists.infradead.org,vger.kernel.org,lists.linux.dev,kvack.org,googlegroups.com,lists.linux-m68k.org,armlinux.org.uk,linux-foundation.org,oracle.com,gmail.com,xen0n.name,loongson.cn,aosc.io,alpha.franken.de,ziepe.ca,arm.com,arndb.de,soleen.com,linux.ibm.com,linux.alibaba.com,brainfault.org,linux.dev,dabbelt.com,eecs.berkeley.edu,ghiti.fr,linux.intel.com,infradead.org,redhat.com,alien8.de,zytor.com,cmpxchg.org,tencent.com,google.com,os.amperecomputing.com,zeniv.linux.org.uk,siemens-energy.com,iscas.ac.cn,pigmoral.tech,linutronix.de,huawei.com,gaisler.com,suse.com,southpole.se,saunalahti.fi];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[linux-m68k.org];
	FORGED_RECIPIENTS(0.00)[m:yeoreum.yun@arm.com,m:dave.hansen@intel.com,m:david@kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:loongarch@lists.linux.dev,m:linux-mips@vger.kernel.org,m:linux-arch@vger.kernel.org,m:kvm-riscv@lists.infradead.org,m:linux-riscv@lists.infradead.org,m:x86@kernel.org,m:linux-mm@kvack.org,m:kasan-dev@googlegroups.com,m:linux-csky@vger.kernel.org,m:linux-m68k@lists.linux-m68k.org,m:linux-openrisc@vger.kernel.org,m:linux@armlinux.org.uk,m:akpm@linux-foundation.org,m:ankur.a.arora@oracle.com,m:rppt@kernel.org,m:linmag7@gmail.com,m:chleroy@kernel.org,m:klarasmodin@gmail.com,m:chenhuacai@kernel.org,m:kernel@xen0n.name,m:kas@kernel.org,m:zhangtianyang@loongson.cn,m:wangyuli@aosc.io,m:tsbogend@alpha.franken.de,m:ljs@kernel.org,m:jgg@ziepe.ca,m:catalin.marinas@arm.com,m:will@kernel.org,m:arnd@arndb.de,m:ryan.roberts@arm.com,m:pasha.tatashin@soleen.com,m:rmclure@linux.ibm.com,m:baolin.wang@linux.alibaba.com,m:tj@kernel.org,m:kevin.br
 odsky@arm.com,m:anup@brainfault.org,m:atish.patra@linux.dev,m:pjw@kernel.org,m:palmer@dabbelt.com,m:aou@eecs.berkeley.edu,m:alex@ghiti.fr,m:dave.hansen@linux.intel.com,m:luto@kernel.org,m:peterz@infradead.org,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:hpa@zytor.com,m:hannes@cmpxchg.org,m:mhocko@kernel.org,m:qi.zheng@linux.dev,m:shakeel.butt@linux.dev,m:kasong@tencent.com,m:baohua@kernel.org,m:axelrasmussen@google.com,m:yuanchu@google.com,m:weixugc@google.com,m:ryabinin.a.a@gmail.com,m:glider@google.com,m:andreyknvl@gmail.com,m:dvyukov@google.com,m:vincenzo.frascino@arm.com,m:anshuman.khandual@arm.com,m:yang@os.amperecomputing.com,m:chaitanyas.prakash@arm.com,m:ardb@kernel.org,m:guoren@kernel.org,m:yang.li85200@gmail.com,m:viro@zeniv.linux.org.uk,m:dinguyen@kernel.org,m:schuster.simon@siemens-energy.com,m:wangruikang@iscas.ac.cn,m:junhui.liu@pigmoral.tech,m:muchun.song@linux.dev,m:vishal.moola@gmail.com,m:namcao@linutronix.de,m:pavel@kernel.org,m:djbw@kernel.org,m:yu-cheng
 .yu@intel.com,m:baolu.lu@linux.intel.com,m:Jonathan.Cameron@huawei.com,m:coxu@redhat.com,m:andreas@gaisler.com,m:liam@infradead.org,m:vbabka@kernel.org,m:surenb@google.com,m:mhocko@suse.com,m:shorne@gmail.com,m:jonas@southpole.se,m:stefan.kristiansson@saunalahti.fi,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[geert@linux-m68k.org,linux-mips@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[geert@linux-m68k.org,linux-mips@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_GT_50(0.00)[95];
	R_DKIM_NA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,mail.gmail.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,arm.com:email,linux-m68k.org:email,linux-m68k.org:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 86C9275BAB9

Hi Yeoreum,

On Tue, 14 Jul 2026 at 18:51, Yeoreum Yun <yeoreum.yun@arm.com> wrote:
> On Tue, Jul 14, 2026 at 05:08:24PM +0100, Yeoreum Yun wrote:
> > On Tue, Jul 14, 2026 at 07:35:19AM -0700, Dave Hansen wrote:
> > > On 7/14/26 04:40, Yeoreum Yun wrote:
> > > > @@ -254,22 +255,8 @@ static void effective_prot(struct ptdump_state *pt_st, int level, u64 val)
> > > >         struct pg_state *st = container_of(pt_st, struct pg_state, ptdump);
> > > >         pgprotval_t prot = val & PTE_FLAGS_MASK;
> > > >         pgprotval_t effective;
> > > > -       bool first_level = false;
> > > >
> > > > -       /* Ignore folded levels ... */
> > > > -       if (((level == 0) && mm_p4d_folded(st->mm)) ||
> > > > -           ((level == 1) && mm_pud_folded(st->mm)) ||
> > > > -           ((level == 2) && mm_pmd_folded(st->mm)))
> > > > -               return;
> > > > -
> > > > -       /* ... and make the actual first level remember the protection. */
> > > > -       if (((level == 0)) ||
> > > > -           ((level == 1) && mm_p4d_folded(st->mm)) ||
> > > > -           ((level == 2) && mm_pud_folded(st->mm)) ||
> > > > -           ((level == 3) && mm_pmd_folded(st->mm)))
> > > > -               first_level = true;
> > > > -
> > > > -       if (!first_level) {
> > > > +       if (first_level > st->first_level) {
> > > >                 pgprotval_t higher_prot = st->prot_levels[level - 1];
> > > >
> > > >                 effective = (higher_prot & prot & (_PAGE_USER | _PAGE_RW)) |
> > > > @@ -471,6 +458,15 @@ bool ptdump_walk_pgd_level_core(struct seq_file *m,
> > > >                 .seq            = m
> > > >         };
> > > >
> > > > +       if (mm_pmd_folded (mm))
> > > > +               st->first_level = 3;
> > > > +       else if (mm_pud_folded (mm))
> > > > +               st->first_level = 2;
> > > > +       else if (mm_p4d_folded (mm))
> > > > +               st->first_level = 1;
> > > > +       else
> > > > +               st->first_level = 0;
> > > > +
> > > >         ptdump_walk_pgd(&st.ptdump, mm, pgd);
> > >
> > > This is indeed an improvement and a step in the right direction! Thanks
> > > for looking at this.
> > >
> > > But one of my test for whether it's good x86 code is whether there's any
> > > actually x86-specific logic in it. Isn't this basically a translation
> > > between the integer level number and whether it is folded?
> > >
> > > That seems like a common helper that more than one arch could use. Could
> > > this be stuck in a helper so that all arch/x86 has to do is:
> > >
> > >     if (mm_pt_level_folded(mm, level))
> > >             return;
> >
> > Yes. at least the level semantic in ptdump (pgd is level 0,
> > p4d is level 1, ...) is same to all archs where use ptdump.
> > So It seems reasonable to add this common helper in ptdump.c
> >
>
> Furthermore, the effective_prot() need to require to identify whether
> it's the first pgtable to prevent the inheriting from dummy value.
> So I think it seems to make a ptdump_pt_level_first() like:
>
> diff --git a/mm/ptdump.c b/mm/ptdump.c
> index 973020000096c..2ec5700e4be5e 100644
> --- a/mm/ptdump.c
> +++ b/mm/ptdump.c
> @@ -190,6 +190,23 @@ void ptdump_walk_pgd(struct ptdump_state *st, struct mm_struct *mm, pgd_t *pgd)
>         st->note_page_flush(st);
>  }
>
> +bool pdtump_pt_level_first(struct mm_struct *mm, int level)
> +{
> +       if (!mm || level > CONFIG_PGTABLE_LEVELS)
> +               return false;
> +
> +       if (mm_pmd_folded(mm) && level == 3)
> +               return true;
> +       if (mm_pud_folded(mm) && level == 2)
> +               return true;
> +       if (mm_p4d_folded(mm) && level == 1)
> +               return true;

Is this order (... && level == ...) the optimal order?
On arm64, mm_pud_folded() and mm_p4d_folded() perform several checks.

> +       if (level == 0)
> +               return true;
> +
> +       return false;
> +}
>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

