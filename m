Return-Path: <linux-mips+bounces-15583-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 4qYcEhElTWo0vwEAu9opvQ
	(envelope-from <linux-mips+bounces-15583-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 07 Jul 2026 18:10:57 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D9D271DB2A
	for <lists+linux-mips@lfdr.de>; Tue, 07 Jul 2026 18:10:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=redhat.com header.s=mimecast20190719 header.b=BJ9LaYlp;
	dmarc=pass (policy=quarantine) header.from=redhat.com;
	spf=pass (mail.lfdr.de: domain of "linux-mips+bounces-15583-lists+linux-mips=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-mips+bounces-15583-lists+linux-mips=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 08E0830393BC
	for <lists+linux-mips@lfdr.de>; Tue,  7 Jul 2026 16:05:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9F4C431489;
	Tue,  7 Jul 2026 16:05:12 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C7F34314B3
	for <linux-mips@vger.kernel.org>; Tue,  7 Jul 2026 16:05:09 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783440311; cv=none; b=dUG4sJXJMN1pZWyFcjvbkhgWMVwsTCXtoziI89jxzhINiWHyUrCToio6LL5tNSHlbxNj5hrnd/pBFeHm/Qu+hmOB4ZkO6Y/W+7V/w4QmJDqUBVt6LExg2FEOpSZgS1KhlzxexXTX6Pyw7PCA1tZtt/ir6xieZCzTK1Ex4ModgUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783440311; c=relaxed/simple;
	bh=dGPqLRrLXNV2/M/g3MyzpgOg2V9OlkRngc0mS0hDMVo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e3HM7VzUyj4z3c2Ujd0zA2rasq0FLlEMuH0uWAVEEHG3FMWOBMt3UCcDaub/dqch1WctptVB0KKzrOx9lZW1TA5W3KedYunAVraoecp1R/iwiLnJ3kvV8QyETNxD5bhd691o6IlO4HPUqLOmOFAKxf3TxzRio9DFCCIEdsOE1gA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BJ9LaYlp; arc=none smtp.client-ip=170.10.133.124
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1783440309;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dGPqLRrLXNV2/M/g3MyzpgOg2V9OlkRngc0mS0hDMVo=;
	b=BJ9LaYlpCXEa652Ismr4YLEySfZyR95TuCVKshSHFaFcNv5yi4IkbedoOf/0XFVz6HVrnY
	9GNq994rQuzM1GaCegQvngNLRaQNqE6DCwJ3JweVsEw4P7xHSpJuDUaRfzeqgXrMiDV0a4
	zgvOB4IJKWxoxG8jedvIdBjXOA8O7QA=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-640-pwDA3bRqOJK1ivkEWIILiw-1; Tue,
 07 Jul 2026 12:05:05 -0400
X-MC-Unique: pwDA3bRqOJK1ivkEWIILiw-1
X-Mimecast-MFC-AGG-ID: pwDA3bRqOJK1ivkEWIILiw_1783440303
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 73E001954B18;
	Tue,  7 Jul 2026 16:05:02 +0000 (UTC)
Received: from fedora (unknown [10.44.33.83])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id 4B1431800597;
	Tue,  7 Jul 2026 16:04:57 +0000 (UTC)
Received: by fedora (nbSMTP-1.00) for uid 1000
	oleg@redhat.com; Tue,  7 Jul 2026 18:05:02 +0200 (CEST)
Date: Tue, 7 Jul 2026 18:04:56 +0200
From: Oleg Nesterov <oleg@redhat.com>
To: Renzo Davoli <renzo@cs.unibo.it>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Shuah Khan <shuah@kernel.org>, Alexey Gladkov <legion@kernel.org>,
	Eugene Syromyatnikov <evgsyr@gmail.com>,
	Davide Berardi <berardi.dav@gmail.com>,
	strace-devel@lists.strace.io, "Dmitry V . Levin" <ldv@strace.io>,
	"open list:MIPS" <linux-mips@vger.kernel.org>
Subject: Re: [PATCH v2 1/2] ptrace: PTRACE_SET_SYSCALL_INFO syscall skipping
 support
Message-ID: <ak0jqCyrtFg7azDM@redhat.com>
References: <20260704142643.692754-1-renzo@cs.unibo.it>
 <20260704142643.692754-2-renzo@cs.unibo.it>
 <akn8g3ya85YFqcjV@cs.unibo.it>
 <akpsTT20F6M2QWND@redhat.com>
 <ak0MykKEi4b6AHRV@cs.unibo.it>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ak0MykKEi4b6AHRV@cs.unibo.it>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[alpha.franken.de,vger.kernel.org,linux-foundation.org,kernel.org,gmail.com,lists.strace.io,strace.io];
	TAGGED_FROM(0.00)[bounces-15583-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FORGED_SENDER(0.00)[oleg@redhat.com,linux-mips@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:renzo@cs.unibo.it,m:tsbogend@alpha.franken.de,m:linux-kernel@vger.kernel.org,m:akpm@linux-foundation.org,m:shuah@kernel.org,m:legion@kernel.org,m:evgsyr@gmail.com,m:berardi.dav@gmail.com,m:strace-devel@lists.strace.io,m:ldv@strace.io,m:linux-mips@vger.kernel.org,m:berardidav@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[redhat.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oleg@redhat.com,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-mips];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5D9D271DB2A

On 07/07, Renzo Davoli wrote:
>
> On Sun, Jul 05, 2026 at 04:38:05PM +0200, Oleg Nesterov wrote:
> > OK, lets only allow the _SECCOMP -> _EXIT transition for now.
> done in v3.
> > But will it work on MIPS?
>
> IMHO yes, it will (would).

Agreed, it is not that I think it won't... but it would be nice to have an ACK
from arch/mips maintainers. syscall_trace_enter() is called from MIPS asm code
which I obviously can't understand.

Nevermind. Let me ack your V3.

Oleg.


