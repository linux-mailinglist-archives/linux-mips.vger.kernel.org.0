Return-Path: <linux-mips+bounces-15095-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id MkqkDWd3MGqHTQUAu9opvQ
	(envelope-from <linux-mips+bounces-15095-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 16 Jun 2026 00:06:31 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 855A968A47B
	for <lists+linux-mips@lfdr.de>; Tue, 16 Jun 2026 00:06:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=paul-moore.com header.s=google header.b=BJDCw6rF;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15095-lists+linux-mips=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-mips+bounces-15095-lists+linux-mips=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=paul-moore.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CB17C307ED88
	for <lists+linux-mips@lfdr.de>; Mon, 15 Jun 2026 22:03:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AE813B71C1;
	Mon, 15 Jun 2026 22:03:20 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB7523B6C16
	for <linux-mips@vger.kernel.org>; Mon, 15 Jun 2026 22:03:18 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781561000; cv=pass; b=DYQhq5OS5QkMnOn10Hqks694Fd8yMdYtG6Z5B2NEwZM+IeBpeUs+Jut6IkdfvMVUlI1Dwx8MPjICkGHjHW6SN5swou6iBtvit1kd9f+crkq66ywCLgJr+3bvqhAOU6BGxQD8PDOLw8kbu5W2R+1K4Kzl3415Qpfn5Dqf+cJufBQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781561000; c=relaxed/simple;
	bh=EmFKaOA4oNrlRBvxBZ9rHktVxwJtkaco4eJBdSabd3Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=stQVeMW4ML1F484eNSW/5APQvXyj2fM/5R+5fTmdBXq3bvNW4S1bPDq+vziR0wKwua6u/84Qj0vjDkXTei29HzKT2jMg1srVBG23LXFU57uyje01tI7VVIsxi6zFFlBVTnKl7U06kuv0LqURrcTCG3SXUZ62H2Jc1WTGxk48FrA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=BJDCw6rF; arc=pass smtp.client-ip=209.85.216.53
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-36b8e1760ccso2467200a91.0
        for <linux-mips@vger.kernel.org>; Mon, 15 Jun 2026 15:03:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781560998; cv=none;
        d=google.com; s=arc-20240605;
        b=lFKHd+K69aHQ14k4XpXY9vXKgwe5AKlapbJFot1wJLgOXt+1CE+jQ5PXLNsNfrUin5
         NOQc0PCnAFOtY7SILuBxVIaWaI2GtoDBNhfRogHFpVvVchUsiDYs+2GUJbXow684asTO
         uGGenzp+VojbwIXn1ZJBRRDoBJp/8bLHD4H86CKf3t3YCalDhrYl3I2JIoaU2b2RQv9p
         tyvfaT17cS0CwgI89hD7CXzb0h2s9Hq5Ly31933r7A2ltwsjc3dI+big4gUmmMRgLGZa
         uPeJLvuV8XD8yrqYcASS040+uQIxte6jDT9WTaxT0nUs5Nw8DKgC8w8t+7DYQJltl6nD
         TB3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wlUiFVf+F3ja4t9u45sKndzLjC4xR7XGyYPH3sd+NYE=;
        fh=WbqSbzR1Mu9zHk/+IRo5Wksk40ZBC99eXjjpLsEfmJc=;
        b=kh9SykCRkvdv0hzFt83bIXCXfdBFhg7WIwLWrWMl8/hSWUwXalaHjaXa0ovh8khHUE
         UnJZsSRnk4jnoDMLhpBNG8FZPPxN3v6uLfGHHA7/G/jMqKqLIX3ZjVbRmDnUvrHXGQti
         OkD7fqXFmUDFXlkQPoDGWOBK8q/hbOyAQMTPDOKVVL4vwKOaFURezm5R7Y8T+Aqrzckg
         XczPSwtJSOyOYFV/x4frD1dJpbD5vhr5MKgpnCCkhjMyVJrRFGok0Ln58YzaFLkid+CL
         rvyhAvyRRAR2MDdAjv8lHVoopgRdmoPVJP/SNHGDkTv1sfao4c3v7zwdHFvED4ZX6du5
         yKfA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1781560998; x=1782165798; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wlUiFVf+F3ja4t9u45sKndzLjC4xR7XGyYPH3sd+NYE=;
        b=BJDCw6rFumNKx1ZbmdQRzwmpdly4t68vMzh62PCU+SCpV2yNZCUodou4EdDx/Qx/MW
         6uqjkPcrhEixJmavhk0DxWbhFDZR6Ex++CRCCuuwVmXO4Oa3rzjm3nBbdFcVNypyppAu
         b4zj7rSqzAj8uFRh0O/3B5yoknz35ttIPmwb/1KKWMah3EJkJNZutoqrUj6nPJGS3ZcG
         Cvhq67+/rF3lat4Nwclq1vhvdOUm0JkDpMEC0c8BWgcN6b9IoWnboCiqP+wWbNyVOK7d
         hkX69MERi9QInOruF7yjj8dzkr/v69LsZ8kg533CZ5rzzjIz4XNw+lzP+R5YRw7VvQVU
         bKUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781560998; x=1782165798;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wlUiFVf+F3ja4t9u45sKndzLjC4xR7XGyYPH3sd+NYE=;
        b=j+Kt4m2GR/eTU2fVV1cqlIAubTjh0i6oz962K6OD4MB1qB9qcbNGRhngqSTE5qQ1u5
         N2Dr9TtGiWsT9nZwNGaZmHQT26TrlsY8nsGYBYsYJEiJDcw+fAoVsGYRLGnnSWBuU6mp
         Y7JjFn/hKibmr2Q9YPLHkaM6tjFdJYMWIJG3Yc5NbGb9vTGZYSKkrkxxwa06+Mb+7lSO
         UQjRYL9+oIN7B+RYOZg1bUwU/v08Jk/HJEfK6Xqg2o50Fap2mZY0JADL3kfiB+VAjPhj
         +YQ53XwMaKn4MbNrcIfk07NVuXcOXULLgOFVinJbHjWj5uK0+JRrAe6xCnA+fZDvq7Q1
         tl2w==
X-Forwarded-Encrypted: i=1; AFNElJ/FqX9tImlOu9a82HHIZFL0Kocb4j5Kms7Sl6bAqLYinRO0VcBwZseJxOBkwwAsv35dJKoV25b5jZSl@vger.kernel.org
X-Gm-Message-State: AOJu0YzlCHCEKdQuKmcKQSiVpJPSlTM40aP5VJc64f8uZuzPTOV6ribs
	IQ+Cfenp+AyXjTYllN2lN9PlRUa0owtz3Xgpr0mKrd8CzRW71WnMS30Gg/5nRTuq7Fj3M+jRi92
	2lghuaFX6MVbdAEWEg7+vqzRSLKIHIHuquveeqB0o
X-Gm-Gg: Acq92OH0ZctGZPYrekmLsoc9jg8SGGA+/y0u7Ro5cWWL8JAfWZIB502pTe6sUhw7kRE
	+gYxzrKiLXwLgV4IX0vjCpu9lMjNXfODQzZFbTwlKQVMbloZyNY5SKmOWp7ORu0L0ukv3IL5H2w
	1OgAXkuphXWRigFLhNyLKt5vC7dmODS1Bvd/ubVICf47no54ARtd+RF22mHAi3NByDXt5Ulyuov
	lja6mZwlhitz9jRsFMqen5Zs8oxWoFcBgIq4eKNcUJQE/jClnvk5Mw3Z9nDXYJLRGO15fE1QY5+
	FgiquMM=
X-Received: by 2002:a17:90b:6cc:b0:366:10f1:3d91 with SMTP id
 98e67ed59e1d1-37c5280310fmr980748a91.1.1781560998051; Mon, 15 Jun 2026
 15:03:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260526142838.774711-1-atomlin@atomlin.com> <20260527085221.GQ3126523@noisy.programming.kicks-ass.net>
 <bgjagepcfb7gz6jawatu6kpfmecw46gwg5cvb6r7dl3dn7bt4l@rtymdaslx7ef>
 <20260527155404.GV3126523@noisy.programming.kicks-ass.net>
 <ov33cu2wosubbfufcmfyoinfatecskjgmkvqyit33komlcla2d@2qgj45724bql>
 <20260527195858.GC3493090@noisy.programming.kicks-ass.net>
 <6hqq5oxvlcpmjvyns42dy2vtfvvixy7q4xyyjrrn46jrvsx5ar@gkmjsteqlpzd> <exlgb3dg2kwxgna6gx2qixexvwjjul7z2ya7npal2gz4jjtr7m@h4oxgd74gsbp>
In-Reply-To: <exlgb3dg2kwxgna6gx2qixexvwjjul7z2ya7npal2gz4jjtr7m@h4oxgd74gsbp>
From: Paul Moore <paul@paul-moore.com>
Date: Mon, 15 Jun 2026 18:03:06 -0400
X-Gm-Features: AVVi8CfvZsjFK88VKetzhE6sTJzGZThz-uSnhi3jqg2JCvabtyn_WzFIJ4i1dgo
Message-ID: <CAHC9VhSROg6RGUN4_ZVBoEwYjRnKvyjnkbx2D88c09KiTgY3KQ@mail.gmail.com>
Subject: Re: [PATCH v3] security: Expand task_setscheduler LSM hook to include
 CPU affinity mask
To: Aaron Tomlin <atomlin@atomlin.com>
Cc: tsbogend@alpha.franken.de, jmorris@namei.org, serge@hallyn.com, 
	mingo@redhat.com, juri.lelli@redhat.com, vincent.guittot@linaro.org, 
	stephen.smalley.work@gmail.com, casey@schaufler-ca.com, longman@redhat.com, 
	tj@kernel.org, hannes@cmpxchg.org, mkoutny@suse.com, 
	chenridong@huaweicloud.com, dietmar.eggemann@arm.com, rostedt@goodmis.org, 
	bsegall@google.com, mgorman@suse.de, vschneid@redhat.com, 
	kprateek.nayak@amd.com, omosnace@redhat.com, kees@kernel.org, neelx@suse.com, 
	sean@ashe.io, chjohnst@gmail.com, steve@abita.co, mproche@gmail.com, 
	nick.lange@gmail.com, cgroups@vger.kernel.org, linux-mips@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-security-module@vger.kernel.org, 
	selinux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[paul-moore.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[paul-moore.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-15095-lists,linux-mips=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[paul@paul-moore.com,linux-mips@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:atomlin@atomlin.com,m:tsbogend@alpha.franken.de,m:jmorris@namei.org,m:serge@hallyn.com,m:mingo@redhat.com,m:juri.lelli@redhat.com,m:vincent.guittot@linaro.org,m:stephen.smalley.work@gmail.com,m:casey@schaufler-ca.com,m:longman@redhat.com,m:tj@kernel.org,m:hannes@cmpxchg.org,m:mkoutny@suse.com,m:chenridong@huaweicloud.com,m:dietmar.eggemann@arm.com,m:rostedt@goodmis.org,m:bsegall@google.com,m:mgorman@suse.de,m:vschneid@redhat.com,m:kprateek.nayak@amd.com,m:omosnace@redhat.com,m:kees@kernel.org,m:neelx@suse.com,m:sean@ashe.io,m:chjohnst@gmail.com,m:steve@abita.co,m:mproche@gmail.com,m:nick.lange@gmail.com,m:cgroups@vger.kernel.org,m:linux-mips@vger.kernel.org,m:linux-fsdevel@vger.kernel.org,m:linux-security-module@vger.kernel.org,m:selinux@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:stephensmalleywork@gmail.com,m:nicklange@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[alpha.franken.de,namei.org,hallyn.com,redhat.com,linaro.org,gmail.com,schaufler-ca.com,kernel.org,cmpxchg.org,suse.com,huaweicloud.com,arm.com,goodmis.org,google.com,suse.de,amd.com,ashe.io,abita.co,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[34];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[paul@paul-moore.com,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[paul-moore.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 855A968A47B

On Mon, Jun 15, 2026 at 11:22=E2=80=AFAM Aaron Tomlin <atomlin@atomlin.com>=
 wrote:
> On Wed, May 27, 2026 at 09:19:11PM -0400, Aaron Tomlin wrote:
> > On Wed, May 27, 2026 at 09:58:58PM +0200, Peter Zijlstra wrote:
> > > On Wed, May 27, 2026 at 01:41:52PM -0400, Aaron Tomlin wrote:
> > >
> > > > > > The actual use case here is multi-tenant workload isolation and=
 visibility.
> > > > > > Passing the evaluated cpumask to the BPF LSM allows operators t=
o write a
> > > > > > simple eBPF program to detect spatial boundary overlaps (e.g., =
logging an
> > > > > > event if a requested mask intersects with platform-reserved cor=
es).
> > >
> > > Why isn't cgroups good enough to enforce this? If you create a cgroup
> > > hierarchy per tenant, and constrain them using the cpuset controller,
> > > they should not be able to escape, rendering this event impossible.
> >
> > Hi Peter,
> >
> > You raise a very fair point. The cpuset cgroup controller is indeed the
> > kernel's primary vehicle for spatial enforcement, and under normal
> > circumstances, it successfully prevents a tenant from escaping their
> > designated cores.
> >
> > The cpuset controller does govern resource limits, but does not audit
> > intent. When __sched_setaffinity() is invoked, the kernel compares the
> > requested in_mask against the task's allowed cpuset. If there is only a
> > partial intersection, the kernel silently truncates the requested mask =
to
> > fit the cpuset, without raising any alarm.
> >
> > The BPF LSM hook, conversely, receives the raw, untruncated in_mask,
> > affording operators the visibility to detect, audit, and even reject th=
ese
> > violations of intent before the kernel silently sanitises the input.
> >
> > This patch does not seek to replace the cpuset controller, but rather t=
o
> > complement it by providing auditing capabilities.
> >
> > > > We are not creating a bespoke BPF hook here; rather, we are rectify=
ing a
> > > > historical blind spot within the API. The existing LSM hook is invo=
ked
> > > > during sched_setaffinity(), yet it presently receives only the task=
_struct
> > > > pointer. Consequently, the security module is essentially asked, "S=
hould
> > > > Process A be permitted to alter Process B's affinity?" without bein=
g
> > > > informed of the proposed affinity itself. Providing in_mask simply
> > > > furnishes the existing hook with the requisite payload to make an i=
nformed
> > > > decision.
> > >
> > > It occurs to me that this same argument would require to also pass in
> > > the new sched_attr, no? That way the LSM can inspect the new policy
> > > before it becomes effective.
> >
> > I agree, the underlying logic does indeed extend perfectly to sched_att=
r.
> >
> > Presently, the LSM is equally oblivious as to whether a process is
> > requesting a benign transition to SCHED_BATCH, or attempting to escalat=
e
> > its privileges by requesting a real-time policy such as SCHED_FIFO with
> > maximum priority. Just as with the CPU mask, providing the sched_attr
> > payload would rectify this parallel blind spot, allowing BPF policies t=
o
> > inspect and mediate scheduling attributes before they become effective.
> >
> > If you are amenable, I should be more than happy to expand the scope of=
 the
> > forthcoming patch to include this. Alternatively, we could address the
> > sched_attr expansion in a separate, subsequent patch. Personally, I wou=
ld
> > favour the latter approach, but please do let me know your preference.
> >
> > I very much look forward to hearing Paul's thoughts on whether this ali=
gns
> > with the broader LSM vision.
>
> Hi Paul,
>
> I am writing to politely follow up on the discussion above regarding the
> proposed enhancement to the sched_setaffinity LSM hook.

Generally speaking I wait until all dependencies land in Linus' tree.
I've lost a lot of time in the past sorting out issues only to have
one of the dependencies rejected.

> As you will see from the thread, Peter Zijlstra and I have discussed the
> architectural justification for this change. While the cpuset cgroup
> controller effectively handles spatial enforcement, it silently truncates
> requested affinity masks. Passing the raw in_mask to the LSM hook enables
> security modules (such as the BPF LSM) to audit and mediate the actual
> intent of the request before the kernel sanitises the input, a capability
> that cgroups inherently lack.

The issue of resource control comes up from time to time within the
context of LSMs, and my general comment is that we likely need to see
a more comprehensive approach to what access control on resource
limits would look like from a LSM perspective.  We've seen a lot of
quick changes to solve very specific problems, but I have yet to see a
good proposal of what it would look like for a more comprehensive
approach.

There is also another issue to consider: none of the in-tree LSMs
currently use these new parameters, raising questions about their
purpose, maintainability, etc.  While this is not necessarily a deal
breaker, it does go along with my comment above about taking a more
holistic view of LSM resource controls.

To summarize, I haven't thought about this too much yet because there
are other fires/patches that don't (currently) have the dependency
issues of this patch.  I would also feel a lot better if there was an
in-tree user of this parameter and some discussion of how this might
fit into a more holistic approach to controlling resource limits in
the LSM subsystem.

--=20
paul-moore.com

