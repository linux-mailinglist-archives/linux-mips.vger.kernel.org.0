Return-Path: <linux-mips+bounces-5876-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BFCD99821B
	for <lists+linux-mips@lfdr.de>; Thu, 10 Oct 2024 11:27:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3BFC4B2CC24
	for <lists+linux-mips@lfdr.de>; Thu, 10 Oct 2024 09:19:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5FAD1AF4E9;
	Thu, 10 Oct 2024 09:17:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ONJaXOp9";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="PuD8pwBk";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ONJaXOp9";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="PuD8pwBk"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7B7C18DF81;
	Thu, 10 Oct 2024 09:17:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728551825; cv=none; b=UMRJZFfkscTVXkG4yDiBFy+4KCiKiq88eszgzIKEVKuv0V+D1XUmUZfy8bfB66yjmfYjYZgbrg4b2d4j8QO48WMxOf8h+72CT78Zr7hFtbMNEswq2ZxpRahDjqSaoI205zuxafSLo417RY1gtBHIYA7B162tuabpPc7svQjg5VI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728551825; c=relaxed/simple;
	bh=eWbWk7S/yzvCT8vmbo/px6f16ARqtAMQDMyE16C0G6Q=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=iBuV5oSFJOdeU185kCmot+xAlmoEjktIiUqafH8ZhdoOwohiqCmSpW5pGr5608sr3Dbhu3fYCC+2ghSw9RFAT4jylBzmVqEQkwrCjBFQYu728Ka2lJBl7NHWzD+dJmRWyKj5Rhq8KM2PiFQOLAdrR3BTVmOBne0sJTquXEeTbzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ONJaXOp9; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=PuD8pwBk; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ONJaXOp9; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=PuD8pwBk; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 0CE561FE5F;
	Thu, 10 Oct 2024 09:17:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1728551822; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5Oqr//Vj/gnTSMHS8Vy/JDYrOW8AZs9pfFe+9IS2+v8=;
	b=ONJaXOp9oO1GkrLu5oZfqtn+yl+Mp8Q8ryaKbAV3ikZhlV7EiqrSfcmBy3MHpxlDi5x6xf
	uFDalbfaglVJXWXJNDqSVjUzMtk+JfUNqpuVa6gfMuB5SnJk/nNpAmbAm549bKhnFDwcKX
	lSQ+Tva4n7Wv08gCZdPSJkYJTctQROw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1728551822;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5Oqr//Vj/gnTSMHS8Vy/JDYrOW8AZs9pfFe+9IS2+v8=;
	b=PuD8pwBkGoocNWRRBDPZ8LagPRc0Rf8M1JuP7TzS+fNAoYQMsoOZGoNKgJYh+fag+qFuXC
	GggY1sQYMCrPeLDg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1728551822; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5Oqr//Vj/gnTSMHS8Vy/JDYrOW8AZs9pfFe+9IS2+v8=;
	b=ONJaXOp9oO1GkrLu5oZfqtn+yl+Mp8Q8ryaKbAV3ikZhlV7EiqrSfcmBy3MHpxlDi5x6xf
	uFDalbfaglVJXWXJNDqSVjUzMtk+JfUNqpuVa6gfMuB5SnJk/nNpAmbAm549bKhnFDwcKX
	lSQ+Tva4n7Wv08gCZdPSJkYJTctQROw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1728551822;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5Oqr//Vj/gnTSMHS8Vy/JDYrOW8AZs9pfFe+9IS2+v8=;
	b=PuD8pwBkGoocNWRRBDPZ8LagPRc0Rf8M1JuP7TzS+fNAoYQMsoOZGoNKgJYh+fag+qFuXC
	GggY1sQYMCrPeLDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0067213A6E;
	Thu, 10 Oct 2024 09:17:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id NhiWO42bB2e3fwAAD6G6ig
	(envelope-from <dkirjanov@suse.de>); Thu, 10 Oct 2024 09:17:01 +0000
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 10 Oct 2024 09:17:01 +0000
From: Denis Kirjanov <dkirjanov@suse.de>
To: Jakub Kicinski <kuba@kernel.org>
Cc: davem@davemloft.net, netdev@vger.kernel.org, edumazet@google.com,
 pabeni@redhat.com, kda@linux-powerpc.org, arnd@arndb.de,
 tsbogend@alpha.franken.de, mpe@ellerman.id.au, npiggin@gmail.com,
 christophe.leroy@csgroup.eu, naveen@kernel.org, maddy@linux.ibm.com,
 pctammela@mojatatu.com, victor@mojatatu.com, coelacanthushex@gmail.com,
 jhs@mojatatu.com, horms@kernel.org, shannon.nelson@amd.com,
 sd@queasysnail.net, linux-mips@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH net-next] eth: remove the DLink/Sundance (ST201) driver
In-Reply-To: <20241008154824.1448370-1-kuba@kernel.org>
References: <20241008154824.1448370-1-kuba@kernel.org>
User-Agent: Roundcube Webmail
Message-ID: <6a5ad6ad6b432e56817883e890a0550d@suse.de>
X-Sender: dkirjanov@suse.de
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Score: -4.29
X-Spamd-Result: default: False [-4.29 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	XM_UA_NO_VERSION(0.01)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[davemloft.net,vger.kernel.org,google.com,redhat.com,linux-powerpc.org,arndb.de,alpha.franken.de,ellerman.id.au,gmail.com,csgroup.eu,kernel.org,linux.ibm.com,mojatatu.com,amd.com,queasysnail.net,lists.ozlabs.org];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:mid,suse.de:email]
X-Spam-Flag: NO
X-Spam-Level: 

On 2024-10-08 15:48, Jakub Kicinski wrote:
> Konstantin reports the maintainer's address bounces.
> There is no other maintainer and the driver is quite old.
> There is a good chance nobody is using this driver any more.
> Let's try to remove it completely, we can revert it back in
> if someone complains.
> 
> Link: 
> https://lore.kernel.org/20240925-bizarre-earwig-from-pluto-1484aa@lemu/
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>
> ---
Acked-by: Denis Kirjanov <dkirjanov@suse.de>

