Return-Path: <linux-mips+bounces-13104-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wMEvJp42gmmVQgMAu9opvQ
	(envelope-from <linux-mips+bounces-13104-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 03 Feb 2026 18:55:42 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 11BACDD2E6
	for <lists+linux-mips@lfdr.de>; Tue, 03 Feb 2026 18:55:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B0C72308CE04
	for <lists+linux-mips@lfdr.de>; Tue,  3 Feb 2026 17:55:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7C0F3659F7;
	Tue,  3 Feb 2026 17:54:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TmzMYPVx";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Rpw4/rGf"
X-Original-To: linux-mips@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0942936655E
	for <linux-mips@vger.kernel.org>; Tue,  3 Feb 2026 17:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770141299; cv=none; b=cSHvlykjVHEAqkSmXKCJpnDhsJ4qoBnX8xdfNi4RpjSo5juJOfuR/HK+fAsZbFGmKgRoAMEacpDYWN0Ly4bBwYJC1dIk1zJpsLUILKUov7r+pdGxJQjzUVmIQ//tbY4R66UxmcLyqo16pWGCDYOAtsQx1mZeF3MmJAZeVF0C6s4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770141299; c=relaxed/simple;
	bh=EbeudItOUlxxdZ+A3AiWDVtDb3JqRGR++QR9pByKdSk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HRGPPnY3BErQnPSQHBatEt7ur4fdNbXpJux9RwyPfp57HpJsLldkGVlREvOyltulw3md53+/m3M3r18SPcMxEJF5Z4ukWvN8MeffIQpLjL+m/clQ3+ss05kaPrHXZNkz4aCmcDP0JqhYqShtnCjmt0bk2QyFtz171gbdufyHXBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TmzMYPVx; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Rpw4/rGf; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1770141296;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TH04C7HHcDm+vfuEaUs+pyru8FvGanMszlIgowU+sDs=;
	b=TmzMYPVxEejfCspZQvKW7R+KFFTjBpS4zAdpC70UY+kGtDuuUUVNRMKunsCMGLtO7zXwlW
	io56wC0WzH8cztOtS/c/JTLyPKCy62Pdg/yGwnRV8ojxXzzflAac0phGiBobdU7USgZMCU
	ha4A/+c6pjZBT6Ih7ZlnitTqVtkEyW4=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-670-YEJyklxfM1awg47BFNj6ew-1; Tue, 03 Feb 2026 12:54:55 -0500
X-MC-Unique: YEJyklxfM1awg47BFNj6ew-1
X-Mimecast-MFC-AGG-ID: YEJyklxfM1awg47BFNj6ew_1770141295
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-503342386a8so240083401cf.0
        for <linux-mips@vger.kernel.org>; Tue, 03 Feb 2026 09:54:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1770141295; x=1770746095; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TH04C7HHcDm+vfuEaUs+pyru8FvGanMszlIgowU+sDs=;
        b=Rpw4/rGfWKFIxHQSKGNkXo3hrZtrNuAk2KG8uGJhMRWnVuHxtAuVTQuQnZjKLnEWUP
         XkKo9nr9xGeW3hJwkIXjyeaNyDbO7Ymo8AnS9YOYLNC1eH81G8P/0YmsiBTsKDc1GxKX
         aWHl61/zsEWxwAx54Zc+oxocL/7nKKJ6vIXFkZ88FNAgIfGIusm1Cr4ESI35azCEDN1e
         2Zh9vNq2xG3rSrJsvw1k9v41KmuQmPVZUfQfPaG8zsHo9+hziJvjlEFsU86IY7P5AYjK
         EmXpKNMF5GLT7fF9rqveOUfEevZ0fDPZM6t/b27lmdsdgtYFi34zT45/U63CnE9q8oet
         lJTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770141295; x=1770746095;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TH04C7HHcDm+vfuEaUs+pyru8FvGanMszlIgowU+sDs=;
        b=u8+uAnRsGS0KKLbO9xhHesf2O/fc5iuiHSJgIf/Bbx6zrkxokih8Tw00BvaPkAsBDO
         Ef1sYHUeGK49hHYC80oAgqQneje/03ntYtRKCQlSGpPRxO5mQEWNFhZl9bBUjcOIIlx+
         +aPD+DTQMBXCqVOwHa+vdaYUN0FpjAQLCKcaP4JJXMCpSxHjxpBzNhDQcO3PW4WEk0Bf
         qpI8GnhNsAZZhrDi/528rTMQZQBE/VYI/0KWjmAPAZzUs4zv2lm1e90rADQ38sAycbA/
         2aM2Xr2kEs3enxELA/ElMuz/ExjlfootHZM3vJ8ZRao/4BFfka6osyhV+6df+6bzixYh
         wyFA==
X-Forwarded-Encrypted: i=1; AJvYcCUCIlkUR2zqS3IIXwtmm3nn+RmZymxr3I++oReC1n3oLd7Nec7TefWr+H/nairzrNR4NGUytRXxJ4es@vger.kernel.org
X-Gm-Message-State: AOJu0Yxn4vcg7gl6de6oBTgmUdAB6EYmm+qbSGlFKBQqTQU5gCPNmrfc
	C8bvwIc7QoF6C4YXmWVMuUrqreD7Bi7ZZ6LtKSIGp7OLO+ShIoCEBsFW1tSZHSGAvcb7I7AC7sF
	R5kfPM44N5mOfAogCA2shn98EZmtGI44jIC9zOQtTaAyt+vxY1vNAoU+vcHNJeJM=
X-Gm-Gg: AZuq6aK83ngNmMaLECG+3MI/C9AFRtjmxTqmg1TIhCegh/hLatTwV+mu4VZZ52jamRw
	kFL/e9a4vUqhkzvgGyF/WT81NdBC6GwMN/AfIsKVhMUC82doge9HQ8BJGEzBch+8AmtA4pIiXNQ
	qcKEqvSGdmhEpieg5HYdC7g8wDkoZHVMJSdVMg8oEYkeBbx1HjB3iZOtjfQ0ehuiQhJvOROKNBX
	YTSls22hJmO79TjW8pyV2RFy9K8SftXi8jNtj3GtR4k8x5tB3w4aew8Wdd2eVq7ttxUe9LX02xF
	sgFqWszSPQOYpzi0q7DeJvr8KQBBexR59nAS3Q0LtJ4PNFfCttXp0WqGYbJ8wlJuvSZai+PuVMv
	m/70TcAMLLhJy2es7Vsnm1p2KHSSdFRsEKZHpeO/mg0Te
X-Received: by 2002:a05:622a:5ca:b0:4f0:22df:9afe with SMTP id d75a77b69052e-5061c18db52mr1685131cf.51.1770141295391;
        Tue, 03 Feb 2026 09:54:55 -0800 (PST)
X-Received: by 2002:a05:622a:5ca:b0:4f0:22df:9afe with SMTP id d75a77b69052e-5061c18db52mr1684941cf.51.1770141294980;
        Tue, 03 Feb 2026 09:54:54 -0800 (PST)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5061c1e7f63sm658131cf.18.2026.02.03.09.54.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 09:54:54 -0800 (PST)
Date: Tue, 3 Feb 2026 12:54:52 -0500
From: Brian Masney <bmasney@redhat.com>
To: Lukas Bulwahn <lbulwahn@redhat.com>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-mips@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
	kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
	Lukas Bulwahn <lukas.bulwahn@redhat.com>
Subject: Re: [PATCH] clk: microchip: fix typo in reference to a config option
Message-ID: <aYI2bKIfRfoFQr2e@redhat.com>
References: <20260203090101.348879-1-lukas.bulwahn@redhat.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260203090101.348879-1-lukas.bulwahn@redhat.com>
User-Agent: Mutt/2.2.14 (2025-02-20)
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[redhat.com:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13104-lists,linux-mips=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bmasney@redhat.com,linux-mips@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 11BACDD2E6
X-Rspamd-Action: no action

On Tue, Feb 03, 2026 at 10:01:01AM +0100, Lukas Bulwahn wrote:
> From: Lukas Bulwahn <lukas.bulwahn@redhat.com>
> 
> Commit 026d70dcfe5d ("clk: microchip: core: allow driver to be compiled
> with COMPILE_TEST") introduces a typo when referring to a config option in
> an ifdef directive.
> 
> Fix this typo.
> 
> Fixes: 026d70dcfe5d ("clk: microchip: core: allow driver to be compiled with COMPILE_TEST")
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@redhat.com>

Ugh... thanks for catching that.

Reviewed-by: Brian Masney <bmasney@redhat.com>


