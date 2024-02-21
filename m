Return-Path: <linux-mips+bounces-1602-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CA5A85DBB5
	for <lists+linux-mips@lfdr.de>; Wed, 21 Feb 2024 14:44:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 48264285626
	for <lists+linux-mips@lfdr.de>; Wed, 21 Feb 2024 13:44:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E61427BB0C;
	Wed, 21 Feb 2024 13:44:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Azt8BjND"
X-Original-To: linux-mips@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5414679DBF
	for <linux-mips@vger.kernel.org>; Wed, 21 Feb 2024 13:44:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708523056; cv=none; b=EUXj8YIyUZjOaf0SFeezNpGfybX3aS9tqMh9Iyudo3v2U8hStKdnnEDQAKwMTtIwByq9G4rysx93EkMVxu6eRjMlkM4pIqJklIEF1nzntIQeXCF/h6FVHJlj8HhOd3b83UDMTBFEB/XnqvjVZ//mxlnapsmQEEZCtBnAY56JCD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708523056; c=relaxed/simple;
	bh=MrsZ6R8kVdxd/n4xz6d/BNCiT9VSGP+MbjDNCaoodJE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gp8dUCPZHiH/dAGsrovJpFagB7WxhEIwZgQcNgW8rFMbP3BFd6wDyt+E9z33Wqu7Jhp5TEIjjYcT/xQqoN5WqXZrT7qCDxv2RRJ0mAxn3lhu3rSPnmTKor+OD/KGYQLJVHitf1ELB94wxf7q3RhJRmnCqvIoY8gB53CCOD2uDSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Azt8BjND; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1708523054;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kjg3ALQw4zFfCtoxrqU3mC8VARBMiLwWXwoSwpKkxVk=;
	b=Azt8BjNDJd15gHUm6FHJABWAyCFAzYi2UlGJExM4pmZtKMHTKN90FgVnKntu4BAXNn2Kug
	2pIqjMQ99qJbdJzHplD+/1c45rxrYJJ8xPr2xP3Kk9cRRWA0Q4RWH/9kJx94nq9/kcldOf
	4Lxz8E96yaNxoZvNcvV8HyCTX2ey74g=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-583-viBCBzv1MZWeE0zNlD0FTQ-1; Wed, 21 Feb 2024 08:44:09 -0500
X-MC-Unique: viBCBzv1MZWeE0zNlD0FTQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1712C867943;
	Wed, 21 Feb 2024 13:44:08 +0000 (UTC)
Received: from localhost (unknown [10.72.116.2])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 21A5F2166B36;
	Wed, 21 Feb 2024 13:44:06 +0000 (UTC)
Date: Wed, 21 Feb 2024 21:44:04 +0800
From: Baoquan He <bhe@redhat.com>
To: Hari Bathini <hbathini@linux.ibm.com>
Cc: linux-s390@vger.kernel.org, piliu@redhat.com, linux-sh@vger.kernel.org,
	x86@kernel.org, kexec@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
	ebiederm@xmission.com, loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
	akpm@linux-foundation.org, linux-arm-kernel@lists.infradead.org,
	viro@zeniv.linux.org.uk
Subject: Re: [PATCH v2 00/14] Split crash out from kexec and clean up related
 config items
Message-ID: <ZdX+JMKsQWheE0B0@MiWiFi-R3L-srv>
References: <20240119145241.769622-1-bhe@redhat.com>
 <9101bb07-70f1-476c-bec9-ec67e9899744@linux.ibm.com>
 <Zb8D1ASrgX0qVm9z@MiWiFi-R3L-srv>
 <559f2595-1477-4ef0-80e4-85ae8b426de7@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <559f2595-1477-4ef0-80e4-85ae8b426de7@linux.ibm.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.6

On 02/21/24 at 11:15am, Hari Bathini wrote:
> Hi Baoquan,
> 
> On 04/02/24 8:56 am, Baoquan He wrote:
> > > > Hope Hari and Pingfan can help have a look, see if
> > > > it's doable. Now, I make it either have both kexec and crash enabled, or
> > > > disable both of them altogether.
> > > 
> > > Sure. I will take a closer look...
> > Thanks a lot. Please feel free to post patches to make that, or I can do
> > it with your support or suggestion.
> 
> Tested your changes and on top of these changes, came up with the below
> changes to get it working for powerpc:
> 
> 
> https://lore.kernel.org/all/20240213113150.1148276-1-hbathini@linux.ibm.com/
> 
> Please take a look.

I added a comment to the patch 1 consulting if the "struct crash_mem" is
appropriate to cover other cases except of kdump memory regions. I am
wondering if its name need be adjusted, or other kind of memory you
mentioned can use other structures or create a new one.

If it's has to be done like that, it's fine. 


