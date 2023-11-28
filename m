Return-Path: <linux-mips+bounces-331-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A00F37FC68E
	for <lists+linux-mips@lfdr.de>; Tue, 28 Nov 2023 22:00:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D132D1C20ED2
	for <lists+linux-mips@lfdr.de>; Tue, 28 Nov 2023 21:00:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CE874437D;
	Tue, 28 Nov 2023 21:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ffg6EfCi"
X-Original-To: linux-mips@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3CCE9D
	for <linux-mips@vger.kernel.org>; Tue, 28 Nov 2023 13:00:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701205205;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CuWcI6wzUqdDFn9EI/mmoM4tOfXa32cQpmhUx/Cp4Lk=;
	b=Ffg6EfCiaAqP+QyoaC7giWkyGqIreZlvbF/czzn24Rrb/dnLOVDgVDwLJY2nsX3etnWa90
	OoH0aZUSDzqWZxx6n9ZHg8cmYysPt7K8cJcj/XSEo2IEtCnYd+XNBfIWQtdC2qB8rdkvD6
	gdiBpF9AS1UIwj5eEI5+okmRv9KNixI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-696-mZZPkzUzNjGETRwYhd2okw-1; Tue, 28 Nov 2023 16:00:01 -0500
X-MC-Unique: mZZPkzUzNjGETRwYhd2okw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6EFA9828B24;
	Tue, 28 Nov 2023 21:00:01 +0000 (UTC)
Received: from dhcp-27-174.brq.redhat.com (unknown [10.45.224.14])
	by smtp.corp.redhat.com (Postfix) with SMTP id 651942166B2C;
	Tue, 28 Nov 2023 21:00:00 +0000 (UTC)
Received: by dhcp-27-174.brq.redhat.com (nbSMTP-1.00) for uid 1000
	oleg@redhat.com; Tue, 28 Nov 2023 21:58:56 +0100 (CET)
Date: Tue, 28 Nov 2023 21:58:54 +0100
From: Oleg Nesterov <oleg@redhat.com>
To: "Maciej W. Rozycki" <macro@orcam.me.uk>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org
Subject: Re: mips: question about switch_to()->__sanitize_fcr31()
Message-ID: <20231128205854.GA29462@redhat.com>
References: <20231121135220.GA952@redhat.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231121135220.GA952@redhat.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.6

ping.

On 11/21, Oleg Nesterov wrote:
>
> Hello,
>
> I know absolutely nothing about arch/mips, I can't even find the
> definition of "current" or the caller of switch_to().
>
> So, __sanitize_fcr31() is called by switch_to() and it does
> force_fcr31_sig(fcr31, pc, next).
>
> Was "current" already updated at this stage so that next == current?
>
>
> Why I am asking. I want to add
>
> 	// otherwise the usage of ->siglock is not safe
> 	WARN_ON(!(t == current || task_is_traced(t)));
>
> into force_sig_info_to_task() and simplify it a bit, but I don't
> know if "t == current" is already true at the start of switch_to().
>
>
> Thanks,
>
> Oleg.


