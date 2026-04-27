Return-Path: <linux-mips+bounces-14359-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MJ/3KbWy72n5DwEAu9opvQ
	(envelope-from <linux-mips+bounces-14359-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 27 Apr 2026 21:02:13 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C6F6478EEE
	for <lists+linux-mips@lfdr.de>; Mon, 27 Apr 2026 21:02:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 56A483048DC2
	for <lists+linux-mips@lfdr.de>; Mon, 27 Apr 2026 19:01:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF2C83EE1D5;
	Mon, 27 Apr 2026 19:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="IKjxtouF"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0363C3563FB
	for <linux-mips@vger.kernel.org>; Mon, 27 Apr 2026 19:01:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777316510; cv=none; b=JmfARaNjwfHUsuutJv/XWgtAuwZ2AITmijT95rtitu7PBcWZSscVDzNs4mR25eTQveAGKzD+4qM9uZLvx8iosGY13HSJqAm0yjfIlDv0Qm0lNHvmdMujFGMbUu/DEc19B1feKihLJbbUvHBN1tMq/lS7PB5p9Qhz6tMCPGFc468=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777316510; c=relaxed/simple;
	bh=uZcs19/Xz2Ob/TZtlFxfTZJJVxYMOQeT/up2L3GOvIQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JCLtCIWt78sHRUcb4/nq2UgnfyeO5jAawo+PBWOEpcAt6XRO2xCXMaofa0+n8cvX4ex+1SMJGbkNZUvVT9T+iZyANvDCznHjpDb7BhJjaFiOQrxiSqMxP69KvqLsv8IDo0RkZTAzrI15FrW7GWBU9R4izlAOGhDy/njAEH0gjgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=IKjxtouF; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-67179ed133dso11801865a12.2
        for <linux-mips@vger.kernel.org>; Mon, 27 Apr 2026 12:01:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1777316507; x=1777921307; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=eo95+vxRQveZjyTXx2nQjz3zXl5qvV2nK5Gunw4PJlE=;
        b=IKjxtouFbOPcEJahJjsxmI2XRciycKyLDNKs7ZOBq5nlWihJtrWjlekNSs1Ats2CQv
         D4mzaeon75cP3dKUISSHoLSEqzho1P0UDiz6O/uGxvZHkFU98buxKwfvBj2tU0OKLpB7
         Y/Z3jVmogaiXM+AsT6NDTQ2LMUNI/PYtxgO6I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777316507; x=1777921307;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eo95+vxRQveZjyTXx2nQjz3zXl5qvV2nK5Gunw4PJlE=;
        b=lP5MctuFFWBcmsIA6uhPBmunche+TuuFpHGLHS1ubkHubK5lIv6ZcwGIuL4HkIq9AI
         ftH7irUlrYEZqpygC4PKtHmIyxs+9GRvfBz/K/PAGEw/NT0bUTQIR6sgYGNbeFOz5w+1
         sssgGG2dngTg+psDlcl621vnxJhunkBdLfuRL7Jc/aS9eO5U7W+LUHhv6+tsXdP3W1l+
         eYbVl443bbkGWiLMRaD+pW+wOYXTQY7lUNWKmckjVR4mcSnxIWQQZ7EjIVr9qMc+nIl8
         PV/czYnY5EXdK0eZZ8E0ScVkcH9NBE7+Y/hHxe3TlmHvfTi33alj7pRdpdeggFk/5R+4
         48SA==
X-Forwarded-Encrypted: i=1; AFNElJ9VAw383Boc/r2uD1KRNuos/UZSbcTGHTrsgCWDUZYtvcgmUe0XbFXn6FWnRDa/FZOfBZiHme0Jp1/7@vger.kernel.org
X-Gm-Message-State: AOJu0YyPkf8GHcudEJBoDYDv7BEAOfYkiFFikML+2Qzf83fSCF9K2F8y
	Qw26UUz6fvzJLZetPcbk88KS2DQrGbh/Z0y1G96xMkgdq3eseoLm7F/tJO/2y1nu2h3YoztQyDp
	zGJPgOes=
X-Gm-Gg: AeBDievoJYjOImXL6GSwVP05COs4Vyj2R5xUGSiDDSuDnPKOeYOp+5tzZ33sVeJYdLP
	ey6eRE7II+g2qR6x+u54/2IkVOBz669TJCJDaJUD41jKrVwpZKMoYiJH5vkIrZcaFxuaBl4hBOY
	52OYq3/Je1gZfH5M5ZRgX8/jKBLboWAFStqq1dL7ZMYYD78/KvjKj8ZRFmkWdG36DZd/tzg87xO
	Ki6AHY/TD5cMWUDWtNqfanj1WjccGMe9aYibzb25jatcu42T7c+E0/zyIojZ33E/4PniCw7H3/t
	sF8KjPUK1/hpRUJrCHjPy7TLcDg6wVEWlhUoozXJxx4Snov/79w1R6EiLiwefRlS0xz7mMqeX0/
	zYkhPCLovY+flwawOBgxFUn0/uNoiyS1LZ0LGRhQTEk4dIWbMZgwNaHopvZfQ8znsY6LAz6vOut
	DDi6SXD2QA5MJIKD80NgMZ72pHJS6V1xIbEychkKou1VRcxpHLPfJiF8lWvv4OXRM1YFYsIaiMW
	aoU1MpkJxE=
X-Received: by 2002:a05:6402:a2c7:20b0:676:6eaf:52be with SMTP id 4fb4d7f45d1cf-679b6735cafmr199094a12.13.1777316507065;
        Mon, 27 Apr 2026 12:01:47 -0700 (PDT)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com. [209.85.218.41])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-679b6863309sm56920a12.29.2026.04.27.12.01.42
        for <linux-mips@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Apr 2026 12:01:44 -0700 (PDT)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-baa8c78ac7fso970147366b.0
        for <linux-mips@vger.kernel.org>; Mon, 27 Apr 2026 12:01:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8JWFRGVPnRRq5deuYLCuofs2Ay6w23N2i59g7XHNhtWgGsZBJBoLUsnxfGLz8mzeWD8QvXu07QvSMg@vger.kernel.org
X-Received: by 2002:a17:907:9495:b0:ba3:a8ef:3597 with SMTP id
 a640c23a62f3a-bb80443c92emr2812866b.25.1777316502372; Mon, 27 Apr 2026
 12:01:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1777306795.git.chleroy@kernel.org> <289b424e243ba2c4139ea04009cf8b9c448a87ff.1777306795.git.chleroy@kernel.org>
In-Reply-To: <289b424e243ba2c4139ea04009cf8b9c448a87ff.1777306795.git.chleroy@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 27 Apr 2026 12:01:23 -0700
X-Gmail-Original-Message-ID: <CAHk-=whC1DZojwdMB1=sJWG2=dsCdfyU8N6tDE1qx50HRZ-WJQ@mail.gmail.com>
X-Gm-Features: AVHnY4JOOuu1ghb35GF5M7sO3SAfkj4A7WtLiFNY579kWyh92WWRKfW5QE_KjRI
Message-ID: <CAHk-=whC1DZojwdMB1=sJWG2=dsCdfyU8N6tDE1qx50HRZ-WJQ@mail.gmail.com>
Subject: Re: [RFC PATCH v1 5/9] uaccess: Switch to copy_{to/from}_user_partial()
 when relevant
To: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: Yury Norov <ynorov@nvidia.com>, Andrew Morton <akpm@linux-foundation.org>, 
	David Laight <david.laight.linux@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, 
	linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	kvm@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-um@lists.infradead.org, dmaengine@vger.kernel.org, 
	linux-efi@vger.kernel.org, linux-fsi@lists.ozlabs.org, 
	amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	intel-gfx@lists.freedesktop.org, linux-wpan@vger.kernel.org, 
	netdev@vger.kernel.org, linux-wireless@vger.kernel.org, 
	linux-spi@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-serial@vger.kernel.org, 
	linux-usb@vger.kernel.org, xen-devel@lists.xenproject.org, 
	linux-fsdevel@vger.kernel.org, ocfs2-devel@lists.linux.dev, 
	bpf@vger.kernel.org, kasan-dev@googlegroups.com, linux-mm@kvack.org, 
	linux-x25@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-sound@vger.kernel.org, sound-open-firmware@alsa-project.org, 
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org, 
	linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linux-sh@vger.kernel.org, linux-arch@vger.kernel.org
Content-Type: multipart/mixed; boundary="000000000000c765e2065075bee2"
X-Rspamd-Queue-Id: 0C6F6478EEE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.94 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_ALLOW(-0.20)[linux-foundation.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[multipart/mixed,text/plain,text/x-patch];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-14359-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_NA(0.00)[linux-foundation.org];
	RCPT_COUNT_TWELVE(0.00)[48];
	MIME_TRACE(0.00)[0:+,1:+,2:+];
	FREEMAIL_CC(0.00)[nvidia.com,linux-foundation.org,gmail.com,linutronix.de,vger.kernel.org,lists.infradead.org,lists.ozlabs.org,lists.freedesktop.org,lists.linux.dev,lists.xenproject.org,googlegroups.com,kvack.org,alsa-project.org,lists.linux-m68k.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_ATTACHMENT(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[torvalds@linux-foundation.org,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[linux-foundation.org:+];
	TAGGED_RCPT(0.00)[linux-mips];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,linux-foundation.org:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

--000000000000c765e2065075bee2
Content-Type: text/plain; charset="UTF-8"

On Mon, 27 Apr 2026 at 10:18, Christophe Leroy (CS GROUP)
<chleroy@kernel.org> wrote:
>
> In a subsequent patch, copy_{to/from}_user() will be modified to
> return -EFAULT when copy fails.

Please don't do this.

This is a maintenance nightmare, and changes pretty much three decades
of semantics, and will cause *very* subtle backporting issues if
somebody happens to rely on the old / new behavior.

I understand the reasoning for the change, but I really don't think
the pain of creating yet another user copy interface is worth it.

We already have a lot of different versions of user copies for
different reasons, and while they all tend to have a good reason (and
some not-so-good, but historical reasons) for existing, this one
doesn't seem worth it.

The main - perhaps only - reason for this "partial" version is that
you want to do that "automatically inlined and optimized fixed-sized
case".

But here's the thing: I think you can already do that. Yes, it
requires some improvements to unsafe_copy_from_user(), but *that*
interface doesn't have three decades of history associated with it,
_and_ you're extending on that one anyway in this series.

"unsafe_copy_from_user()" is very odd, is meant only for small simple
copies that can be inlined and it's special-cased for 'objtool' anyway
(because objtool would have complained about an out-of-line call,
although it could have been special-cased other ways).

In other words: unsafe_copy_from_user() is *very* close to what you
want for that "Oh, I noticed that it's a small fixed-size copy, so I
want to special-case copy-from-user for that".

The _only_ issue with unsafe_copy_from_user() is that you can't see
that there were partial successes. But if *that* was fixed, then this
whole "create a new copy_from_user interface" issue would just go
away.

So please - let's just change unsafe_copy_from_user() to be usable for
the partial case.

And the thing is, all the existing unsafe_copy_from_user()
implementations already effectively *have* the "how much did I not
copy" internally, and they actually do extra work to hide it, ie they
have things like that

        int _i;

that is "how many bytes have I copied" in the powerpc implementation,
or the x86 code does

        size_t __ucu_len = (_len);

where that "ucu_len" is updated as you go along and is literally the
"how many bytes are left to copy" return value that is missing from
this interface.

So what I would suggest is

 - introduce a new user accessor helper that is used for *both*
unsafe_copy_to/from_user() *and* the "inline small constant-sized
normal copy_to/from_user()" calls

 - it's the same thing as the existing  unsafe_copy_to/from_user()
implementation, except it exposes how many bytes are left to be copied
to the exception label.

IOW, it would look something like

     #define unsafe_copy_to_user_outlen(_dst,_src,_len,label)...

which is exactly the same as the current unsafe_copy_to_user(),
*except* it changes "_len" as it does along.

And then you use that for both the "real" unsafe_copy_user and for the
"small constant values" case.

Just as an example, attached is a completely stupid rough draft of a
patch that does this for x86 and only for unsafe_copy_to_user().

And I made a very very hacky change to kernel/sys.c to see what the
code generation looks like.

This is what it results in on x86 with clang (with all the magic
.section data edited out):

        ... edited out the code to generate the times
        ... this is the actual user copy:
        # HERE!
        movabsq $81985529216486895, %rcx        # imm = 0x123456789ABCDEF
        cmpq    %rcx, %rbx
        cmovaq  %rcx, %rbx
        stac
        movq    %r13, (%rbx)                    # exception to .LBB45_8
        movq    %r14, 8(%rbx)                   # exception to .LBB45_8
        movq    %r15, 16(%rbx)                  # exception to .LBB45_8
        movq    %rax, 24(%rbx)                  # exception to .LBB45_8
        clac
.LBB45_6:
        movq    jiffies(%rip), %rdi
        callq   jiffies_64_to_clock_t
.LBB45_7:
        addq    $16, %rsp
        popq    %rbx
        popq    %r12
        popq    %r13
        popq    %r14
        popq    %r15
        retq
.LBB45_8:
        clac
        movq    $-14, %rax
        jmp     .LBB45_7

and notice how the compiler noticed that the 'outlen' isn't actually
used, and turned the exception label into just a "return -EFAULT" and
never actually generated any code for updating remaining lengths?

That actually looks pretty much optimal for a 32-byte user copy.

And it didn't involve changing the semantics at all.

Just to check, I changed that "times()" system call to return the
number of bytes uncopied instead (to emulate the "I actually want to
know what's left" case), and it generated this:

        # HERE!
        movabsq $81985529216486895, %rcx        # imm = 0x123456789ABCDEF
        cmpq    %rcx, %rbx
        cmovaq  %rcx, %rbx
        stac
        movl    $32, %ecx
        movq    %r13, (%rbx)                    # exception to .LBB45_7
        movl    $24, %ecx
        movq    %r15, 8(%rbx)                   # exception to .LBB45_7
        movl    $16, %ecx
        movq    %r14, 16(%rbx)                  # exception to .LBB45_7
        movl    $8, %ecx
        movq    %rax, 24(%rbx)                  # exception to .LBB45_7
        clac
        xorl    %ecx, %ecx
.LBB45_8:
        movq    %rcx, %rax
        addq    $16, %rsp
        popq    %rbx
        popq    %r12
        popq    %r13
        popq    %r14
        popq    %r15
        retq
.LBB45_6:
        movq    jiffies(%rip), %rdi
        jmp     jiffies_64_to_clock_t           # TAILCALL
.LBB45_7:
        clac
        jmp     .LBB45_8

so it all seems to work - although obviously the above is *not* the normal case.

NOTE NOTE NOTE! The attached patch is entirely untested. I obviously
did some "test code generation" with it, but I only *looked* at the
result, and maybe it has some fundamental problem that I just didn't
notice. So treat this as a "how about this approach" patch, not as
anything more serious than that.

And the kerrnel/sys.c hack is very obviously just that: a complate
hack for testing.

A real patch would do that "for small constant-sized copies, turn
copy_to_user() automatically into "_small_copy_to_user()".

The attached is *not* a real patch. Treat it with the contempt it deserves.

             Linus

--000000000000c765e2065075bee2
Content-Type: text/x-patch; charset="US-ASCII"; name="patch.diff"
Content-Disposition: attachment; filename="patch.diff"
Content-Transfer-Encoding: base64
Content-ID: <f_mohk3mm10>
X-Attachment-Id: f_mohk3mm10

IGFyY2gveDg2L2luY2x1ZGUvYXNtL3VhY2Nlc3MuaCB8IDE3ICsrKysrKysrKysrLS0tLS0tCiBp
bmNsdWRlL2xpbnV4L3VhY2Nlc3MuaCAgICAgICAgfCAxNiArKysrKysrKysrKysrKysrCiBrZXJu
ZWwvc3lzLmMgICAgICAgICAgICAgICAgICAgfCAgMyArKy0KIDMgZmlsZXMgY2hhbmdlZCwgMjkg
aW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9hcmNoL3g4Ni9pbmNs
dWRlL2FzbS91YWNjZXNzLmggYi9hcmNoL3g4Ni9pbmNsdWRlL2FzbS91YWNjZXNzLmgKaW5kZXgg
M2EwZGQzYzJiMjMzLi4zYjJjNTdjOTE0MTggMTAwNjQ0Ci0tLSBhL2FyY2gveDg2L2luY2x1ZGUv
YXNtL3VhY2Nlc3MuaAorKysgYi9hcmNoL3g4Ni9pbmNsdWRlL2FzbS91YWNjZXNzLmgKQEAgLTYw
NiwxNSArNjA2LDIwIEBAIF9sYWJlbDoJCQkJCQkJCQlcCiAJCWxlbiAtPSBzaXplb2YodHlwZSk7
CQkJCQkJXAogCX0KIAotI2RlZmluZSB1bnNhZmVfY29weV90b191c2VyKF9kc3QsX3NyYyxfbGVu
LGxhYmVsKQkJCVwKKyNkZWZpbmUgdW5zYWZlX2NvcHlfdG9fdXNlcl9vdXRsZW4oX2RzdCxfc3Jj
LF9sZW4sbGFiZWwpCVwKIGRvIHsJCQkJCQkJCQlcCiAJY2hhciBfX3VzZXIgKl9fdWN1X2RzdCA9
IChfZHN0KTsJCQkJXAogCWNvbnN0IGNoYXIgKl9fdWN1X3NyYyA9IChfc3JjKTsJCQkJCVwKLQlz
aXplX3QgX191Y3VfbGVuID0gKF9sZW4pOwkJCQkJXAotCXVuc2FmZV9jb3B5X2xvb3AoX191Y3Vf
ZHN0LCBfX3VjdV9zcmMsIF9fdWN1X2xlbiwgdTY0LCBsYWJlbCk7CVwKLQl1bnNhZmVfY29weV9s
b29wKF9fdWN1X2RzdCwgX191Y3Vfc3JjLCBfX3VjdV9sZW4sIHUzMiwgbGFiZWwpOwlcCi0JdW5z
YWZlX2NvcHlfbG9vcChfX3VjdV9kc3QsIF9fdWN1X3NyYywgX191Y3VfbGVuLCB1MTYsIGxhYmVs
KTsJXAotCXVuc2FmZV9jb3B5X2xvb3AoX191Y3VfZHN0LCBfX3VjdV9zcmMsIF9fdWN1X2xlbiwg
dTgsIGxhYmVsKTsJXAorCXVuc2FmZV9jb3B5X2xvb3AoX191Y3VfZHN0LCBfX3VjdV9zcmMsIF9s
ZW4sIHU2NCwgbGFiZWwpOwlcCisJdW5zYWZlX2NvcHlfbG9vcChfX3VjdV9kc3QsIF9fdWN1X3Ny
YywgX2xlbiwgdTMyLCBsYWJlbCk7CVwKKwl1bnNhZmVfY29weV9sb29wKF9fdWN1X2RzdCwgX191
Y3Vfc3JjLCBfbGVuLCB1MTYsIGxhYmVsKTsJXAorCXVuc2FmZV9jb3B5X2xvb3AoX191Y3VfZHN0
LCBfX3VjdV9zcmMsIF9sZW4sIHU4LCBsYWJlbCk7CVwKK30gd2hpbGUgKDApCisKKyNkZWZpbmUg
dW5zYWZlX2NvcHlfdG9fdXNlcihfZHN0LF9zcmMsX2xlbixsYWJlbCkJCQlcCitkbyB7CQkJCQkJ
CQkJXAorCXNpemVfdCBfX3VjdV9sZW4gPSBfbGVuOwkJCQkJXAorCXVuc2FmZV9jb3B5X3RvX3Vz
ZXJfb3V0bGVuKF9kc3QsX3NyYyxfX3VjdV9sZW4sbGFiZWwpOwkJXAogfSB3aGlsZSAoMCkKIAog
I2lmZGVmIENPTkZJR19DQ19IQVNfQVNNX0dPVE9fT1VUUFVUCmRpZmYgLS1naXQgYS9pbmNsdWRl
L2xpbnV4L3VhY2Nlc3MuaCBiL2luY2x1ZGUvbGludXgvdWFjY2Vzcy5oCmluZGV4IDU2MzI4NjAx
MjE4Yy4uMWE3MGVmNzA3ODRjIDEwMDY0NAotLS0gYS9pbmNsdWRlL2xpbnV4L3VhY2Nlc3MuaAor
KysgYi9pbmNsdWRlL2xpbnV4L3VhY2Nlc3MuaApAQCAtODc0LDQgKzg3NCwyMCBAQCB2b2lkIF9f
bm9yZXR1cm4gdXNlcmNvcHlfYWJvcnQoY29uc3QgY2hhciAqbmFtZSwgY29uc3QgY2hhciAqZGV0
YWlsLAogCQkJICAgICAgIHVuc2lnbmVkIGxvbmcgbGVuKTsKICNlbmRpZgogCitzdGF0aWMgX19h
bHdheXNfaW5saW5lIF9fbXVzdF9jaGVjayB1bnNpZ25lZCBsb25nCitfc21hbGxfY29weV90b191
c2VyKHZvaWQgX191c2VyICp0bywgY29uc3Qgdm9pZCAqZnJvbSwgdW5zaWduZWQgbG9uZyBuKQor
eworCXNpemVfdCB1bmNvcGllZCA9IG47CisKKwltaWdodF9mYXVsdCgpOworCWlmIChzaG91bGRf
ZmFpbF91c2VyY29weSgpKQorCQlyZXR1cm4gbjsKKwlpbnN0cnVtZW50X2NvcHlfdG9fdXNlcih0
bywgZnJvbSwgbik7CisJc2NvcGVkX3VzZXJfd3JpdGVfYWNjZXNzX3NpemUodG8sIG4sIGZhaWxl
ZCkKKwkJdW5zYWZlX2NvcHlfdG9fdXNlcl9vdXRsZW4odG8sIGZyb20sIHVuY29waWVkLCBmYWls
ZWQpOworCXJldHVybiAwOworZmFpbGVkOgorICAgICAgIHJldHVybiB1bmNvcGllZDsKK30KKwog
I2VuZGlmCQkvKiBfX0xJTlVYX1VBQ0NFU1NfSF9fICovCmRpZmYgLS1naXQgYS9rZXJuZWwvc3lz
LmMgYi9rZXJuZWwvc3lzLmMKaW5kZXggNjJlODQyMDU1Y2M5Li42NWIyZDAxMDNhNzMgMTAwNjQ0
Ci0tLSBhL2tlcm5lbC9zeXMuYworKysgYi9rZXJuZWwvc3lzLmMKQEAgLTEwNjcsNyArMTA2Nyw4
IEBAIFNZU0NBTExfREVGSU5FMSh0aW1lcywgc3RydWN0IHRtcyBfX3VzZXIgKiwgdGJ1ZikKIAkJ
c3RydWN0IHRtcyB0bXA7CiAKIAkJZG9fc3lzX3RpbWVzKCZ0bXApOwotCQlpZiAoY29weV90b191
c2VyKHRidWYsICZ0bXAsIHNpemVvZihzdHJ1Y3QgdG1zKSkpCisJCWFzbSB2b2xhdGlsZSgiIyBI
RVJFISIpOworCQlpZiAoX3NtYWxsX2NvcHlfdG9fdXNlcih0YnVmLCAmdG1wLCBzaXplb2Yoc3Ry
dWN0IHRtcykpKQogCQkJcmV0dXJuIC1FRkFVTFQ7CiAJfQogCWZvcmNlX3N1Y2Nlc3NmdWxfc3lz
Y2FsbF9yZXR1cm4oKTsK
--000000000000c765e2065075bee2--

