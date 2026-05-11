Return-Path: <linux-mips+bounces-14552-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wAWnM9s8AmrmpAEAu9opvQ
	(envelope-from <linux-mips+bounces-14552-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 11 May 2026 22:32:27 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5144D515E5E
	for <lists+linux-mips@lfdr.de>; Mon, 11 May 2026 22:32:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E93B5308565A
	for <lists+linux-mips@lfdr.de>; Mon, 11 May 2026 20:28:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DB8B384229;
	Mon, 11 May 2026 20:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="Pqf2D/XX"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64B713803F7
	for <linux-mips@vger.kernel.org>; Mon, 11 May 2026 20:28:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778531308; cv=pass; b=rLe25Dv4EFi+Mkc+p5cHxdW8zN/itBqy/RHAu2c4odK8jXjcgRjtwVVAHoDq2MJvPD7w17I+0ABjQY8WNEtyVouxToN9hF6MCkRuBJZxb5+gEX5H/8orbkh9IDx2r8qRcTsNu5P+ZGd4Mf3tBvFcyfBLs4wU9P+98gsewoosib0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778531308; c=relaxed/simple;
	bh=hTbYoner07O2PP3jB6etyoj2SkkDIbMpdGA9ETgA8QU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZOzVe/H30Zb8VX8fArt0umkbYzrGBnWezYKpb7HK/WN+qJ7QH6fvjRdvBhYUVI9/qMD3X9mekRriTFV+BbbddZy7G+3RTfFH3do8I/CNkKi7uXAvFjNBZyuPEWtwtGOywpuTwXheLvhsBM0zxbU3GIXKAfXvDBzHobtlzfV0hIA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=Pqf2D/XX; arc=pass smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-67e9b3037dcso6560997a12.0
        for <linux-mips@vger.kernel.org>; Mon, 11 May 2026 13:28:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778531305; cv=none;
        d=google.com; s=arc-20240605;
        b=XIBcAU/2A5OZr5TYfe5Yr/Xw0XCudhEr4pg5uCUVdbT3wMgx0lKeY12caOHmol9A30
         s2CatvhGT1Yu2qzpokRexwaVRgiIK6A9pT1FysUySV4DVk5S9d9S9+3oEobKTurW7zWq
         HnGmzssKzmhjYyLeqOV+BfuyHM0FKl5f/BBwZlNdT52s1ZAzwncrW9dbnyfKTkLBzLbO
         cJwSq/ql/eLIBPYHmV28zSCGSImD2dNv1kJZgfhKkIejpjnAYER7dkI/916/IbHj43XW
         Xa3X2BHfavF1IoIrtLXFbA56x62SaeRSi8okkX9pAUzD8vfWTDcZ8eNEFHb6czQByDru
         vgbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ecxYhhOsIWnMbGYp6OiuSoqJt7k54RRM2T4m9yuOxg8=;
        fh=PNInTATTWXqm+OjNCBzk7yBSLCsYiqk2PgwpQCApt08=;
        b=PuQW0mypVyhrcP3CdLF9j/EdP506yVwM9TO5F3CvLSL3RLCiv+02lRkZyAdCZnc9l6
         BreJBgG9c8uiqQuxamUcF2Yx7Yb6WNtyIC6rnWjTYKejlqlxpo/VVFzL8HZGO0heRukT
         1e3ug+9bhXPQQ7zQZbEQNWBAzp0yjWl56HIrKdlZMjStI5rSqLRb8tOJQstXLMz0O67i
         +2yWI3AN42XOQuNfeba8PEQI76M21xL6IQtOySxf+RDkkY09ktc/3LS+j9MBVThpAhU8
         ZVx21+9hi3Vkq8cbFO6m1iN2sfHzD0t8LNb9zqNdh9fIPYDoBq4qmwuR+JOcbeK6Y3e9
         UKRQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1778531305; x=1779136105; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ecxYhhOsIWnMbGYp6OiuSoqJt7k54RRM2T4m9yuOxg8=;
        b=Pqf2D/XXkXoZWPZHQqMY9IBZsTPIzZc2s8hRWTLCIWWh/mCQNnoBCNusWpQOqSxv/M
         30btj8h0UrFnnMsiDnTkMr4mTshByweR1IFq8Cw7xpE5sbpgMjkfIWAIe6bmq2ud60M/
         lWdAm5DtQkIVu7LGk2lBHjld6eiUve2zjik9wv5Je1M48kL8miY1mC8QuCNlg0QUT9c4
         nSZfVBr2RZcJneAM++otv/6PpeB69KFfmV763eRrDzCDclvTtsgmy9FVK0C37xUfOBDB
         +8oxIhRLfsmOVYrtt2u1RAsjRCaJUQTwAW04tUyadp67+w3b8/KYFC5imeXFdAPE+sCl
         n2Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778531305; x=1779136105;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ecxYhhOsIWnMbGYp6OiuSoqJt7k54RRM2T4m9yuOxg8=;
        b=CZpoVw8KSiBr9ySSq9JDljOWFYVq0u0KW41VhSa8/9c8ZUtuLYgv5BpC7M3Gg1zOBP
         L+AMfMP/dCWDX9MAyqPmd8khkHylLfmB/OAvIiE8P1LOfUSExaknf7XMjWt05DJDc775
         hs0YwH2QuZdwOVUzKJV7AqYVKjziFIyNdatnYKg46RNCSfL28jv//xPRU7pX81c1Zy2q
         zXIsVTfmW28HhY/24OTNic8HiPnSFPfMU4zP8/KI/3ZaYlJGWUkwlbdeNd29c1ngQKiU
         sP1iETB0gp3PGQozKmyNL65j/ZiFzD2uSfjDcipNeoGFLlz7vFAi0K0N6lcb3yD4ssrr
         zA3g==
X-Forwarded-Encrypted: i=1; AFNElJ8Cg5wIYqHqLoansXXLbXW17PfjvRXR7g5La8DD4pBZ+O5samx0G2W4/ZnugnFF9SxfxLNE2VURJypo@vger.kernel.org
X-Gm-Message-State: AOJu0YxxsBaUGxUxOpsCzWlKLgTfuTMR2d4xBoGYZ1ZEzqOu6Nww87cE
	ZdzhYD6kUn7xkb7lDe63F37nwcQEDQz0+GaBIpA7U5UBNRYPJmFopuVM/Z4DjWuqWyFJBRDpVtQ
	NRLFWZZ1dC3KSxDa//hZnf8NYwtsuzHD8zwiv2qTz
X-Gm-Gg: Acq92OFKGBai7S2nTIyMHnBwITbrPw3M/nuyZpxQC++5BShLkxeLPnAWpZxBNbabEha
	C+DlgZmpbZw7/amsUgx7kx7PX/wCE1LCA6OMI4Qa+cvb7DiDFWtXrUMmwPRb+Tsk6jAu4VH9jxV
	AoPkjFWDMNAPMIlRX8Yxb3aMATBqxTA/KFsDGNz0YLmXPePYWQ7jTTrUQWmko6w2Aj4352EIyE7
	A5Fgyq9lzBfL6bYKcwHVbh2v5YPETjOyi8vBLHVUCjYVzrmRcfRE1wKgkqmsttsbnfdNEoiFDoE
	4P91akf5BUKeHfIwyw==
X-Received: by 2002:a17:907:782:b0:bba:5bc9:534a with SMTP id
 a640c23a62f3a-bcaac45410dmr950342666b.31.1778531304034; Mon, 11 May 2026
 13:28:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260509213803.968464-1-atomlin@atomlin.com> <20260509213803.968464-4-atomlin@atomlin.com>
In-Reply-To: <20260509213803.968464-4-atomlin@atomlin.com>
From: Paul Moore <paul@paul-moore.com>
Date: Mon, 11 May 2026 16:28:09 -0400
X-Gm-Features: AVHnY4IuuqYYRw63FqWoEIYPWMqlZqNzlszYso7NSfFe-A6xx0Cnf7u9P8UUKq4
Message-ID: <CAHC9VhQthq7y2akbQSdJwBEex1MQYWG49wcJK3b8gSQuQ_d1cQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] security: Expand task_setscheduler LSM hook to
 include CPU affinity mask
To: Aaron Tomlin <atomlin@atomlin.com>
Cc: tsbogend@alpha.franken.de, jmorris@namei.org, serge@hallyn.com, 
	mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com, 
	vincent.guittot@linaro.org, stephen.smalley.work@gmail.com, 
	casey@schaufler-ca.com, longman@redhat.com, tj@kernel.org, hannes@cmpxchg.org, 
	mkoutny@suse.com, chenridong@huaweicloud.com, dietmar.eggemann@arm.com, 
	rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de, vschneid@redhat.com, 
	kprateek.nayak@amd.com, omosnace@redhat.com, kees@kernel.org, neelx@suse.com, 
	sean@ashe.io, chjohnst@gmail.com, steve@abita.co, mproche@gmail.com, 
	nick.lange@gmail.com, cgroups@vger.kernel.org, linux-mips@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-security-module@vger.kernel.org, 
	selinux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 5144D515E5E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[paul-moore.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[paul-moore.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	URIBL_MULTI_FAIL(0.00)[sea.lore.kernel.org:server fail,paul-moore.com:server fail,mail.gmail.com:server fail,atomlin.com:server fail];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-14552-lists,linux-mips=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[35];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[paul-moore.com:+];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[paul@paul-moore.com,linux-mips@vger.kernel.org];
	FREEMAIL_CC(0.00)[alpha.franken.de,namei.org,hallyn.com,redhat.com,infradead.org,linaro.org,gmail.com,schaufler-ca.com,kernel.org,cmpxchg.org,suse.com,huaweicloud.com,arm.com,goodmis.org,google.com,suse.de,amd.com,ashe.io,abita.co,vger.kernel.org];
	TAGGED_RCPT(0.00)[linux-mips];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[atomlin.com:email,mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,paul-moore.com:url,paul-moore.com:dkim]
X-Rspamd-Action: no action

On Sat, May 9, 2026 at 5:38=E2=80=AFPM Aaron Tomlin <atomlin@atomlin.com> w=
rote:
>
> At present, the task_setscheduler LSM hook provides security modules
> with the opportunity to mediate changes to a task's scheduling policy.
> However, when invoked via sched_setaffinity(), the hook lacks
> visibility into the actual CPU affinity mask being requested.
> Consequently, BPF-based security modules are entirely blind to the
> target CPUs and cannot make granular access control decisions based on
> spatial isolation.
>
> In modern multi-tenant and real-time environments, CPU isolation is a
> critical boundary. The inability to audit or restrict specific CPU
> pinning requests limits the effectiveness of eBPF-driven security
> policies, particularly when attempting to shield isolated or
> cryptographic cores from unprivileged or compromised tasks.
>
> This patch expands the security_task_setscheduler() hook signature to
> include a pointer to the requested cpumask. Because this is a shared
> hook used for multiple scheduling attribute changes, call sites that do
> not modify CPU affinity are updated to safely pass NULL.
> To protect against unverified dereferences, the parameter is annotated
> with __nullable in the LSM hook definition, ensuring the BPF verifier
> mandates explicit NULL checks for attached eBPF programs.
>
> This change updates all in-tree security modules (SELinux and Smack) to
> accommodate the new parameter mechanically, whilst providing BPF LSMs
> with the necessary context to enforce strict affinity policies.
>
> Signed-off-by: Aaron Tomlin <atomlin@atomlin.com>
> ---
>  arch/mips/kernel/mips-mt-fpaff.c | 30 +++++++++++++++++-------------
>  fs/proc/base.c                   |  2 +-
>  include/linux/lsm_hook_defs.h    |  3 ++-
>  include/linux/security.h         | 11 +++++++----
>  kernel/cgroup/cpuset.c           |  4 ++--
>  kernel/sched/syscalls.c          |  4 ++--
>  security/commoncap.c             |  7 +++++--
>  security/security.c              | 11 ++++++-----
>  security/selinux/hooks.c         |  3 ++-
>  security/smack/smack_lsm.c       | 11 +++++++++--
>  10 files changed, 53 insertions(+), 33 deletions(-)

I haven't looked too closely at this patch yet, but based on a quick
glance, can you help me understand why it is included with the other
two patches in one patchset?  The other two patches look like stable
level kernel bug fixes, while this patch introduces functionality to
an existing LSM hook; one of these is not like the others :)

Unless there is something critical that I'm missing here, I would
suggest splitting this patch out from the other two bugfixes for
separate handling.  If there is a patch dependency issue you can
always mention that in the cover letter.

--=20
paul-moore.com

