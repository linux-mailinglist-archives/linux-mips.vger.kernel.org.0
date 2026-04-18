Return-Path: <linux-mips+bounces-14195-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id A8+dNhgy42k0DQEAu9opvQ
	(envelope-from <linux-mips+bounces-14195-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Sat, 18 Apr 2026 09:26:16 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 33D01420478
	for <lists+linux-mips@lfdr.de>; Sat, 18 Apr 2026 09:26:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8426C302C6EB
	for <lists+linux-mips@lfdr.de>; Sat, 18 Apr 2026 07:26:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2254033F59A;
	Sat, 18 Apr 2026 07:26:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gjAYgDz9"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD25472623
	for <linux-mips@vger.kernel.org>; Sat, 18 Apr 2026 07:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776497174; cv=none; b=hktggMrtu5YSPvxBXLe+/KhI2etwRrQ5hgs74vC2IT3xkOTmMk5hxuyiEkH/GkqDQcTa3Y2T1VnijYrOueinlVeJVO8+nM7aiYi/mW78JnFamWXPAhOcmrJVXbbJnSlUq3pAhN2b0OCS0waW4FD6t//UkENoP4F5OPfhxKhT5Rc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776497174; c=relaxed/simple;
	bh=NfBO74AWzsORexJezbldg0Bpla0pHuFV2AP5imYCS6I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c/ujCEYr4cSJl0315SexVthGbz3oB64KjlWOuTUyWrW+Yh2tNsDH6685dWreYEH62kl/06Bq/GM6BiIQ//ayUyAN0JIWb8pVDJd2I+ti1M8qMvA9WYyKtMMsv3tMmOTXWxY5os3opiGPB7ZBt/DieM7O2oeJsjdPj0ucIIgEAAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gjAYgDz9; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-488a4bc360bso8281395e9.0
        for <linux-mips@vger.kernel.org>; Sat, 18 Apr 2026 00:26:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776497171; x=1777101971; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RMJY5sJFMFRVZoxP4MSEGf9jQstn+5lnWoe32mr/X0w=;
        b=gjAYgDz9u9bw78oRT4n1MWGT+QhtYrF7aPlrxmwW8bb2qy6AeTwmXcyPbZxFy8+f6Y
         vldAOwL+hV3XB/iJgXY6bQ/6Ia+JC94rMuregG6xN1YGe/mTvzUvpDnQHOXLWgXHFmgL
         sgHtGVcf6Hlpog+fqEjWLSqCLCG6HMHNpCuxNf+sRLGfsHQ/ohhI5FjL//nfKXb2dXL5
         OMbyr07baBRX6xzedQRV/v+IfTZ8Do9leigkhwCVPenlhz2xbwq/Hh6MQ02BOiei5F6R
         a01A8FYHPlwJOdL8+N5ToXVhOtT3zIb8ZPpevkenvnVn83zxb+KtmrnDGYDEhSyJa+9W
         w5vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776497171; x=1777101971;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RMJY5sJFMFRVZoxP4MSEGf9jQstn+5lnWoe32mr/X0w=;
        b=Uo67PD2BC0V5XFFCJ1P3mNHdpaIEHzkIFwgsgRwf5+onHg7hjXZDoBDCE8o85eflB0
         3wOnFP5tqCTMqK9vXEgabPlLcTzsEen0aWoFJb2Z9wvOchRL20sxOcV5ubrcvsL6+mns
         ecUgiFiz4SsvGuwWvF0tX1OMnp9tdcR1BzMIrbsImCpW/ZMjtIIru81hFaYXiZW6MK/m
         U+QH4/kBt+L3DBFDt2kjJ1AAypNT3AG3Ku5k5dZSWY9Afgsm/67ubUNaz3fqAN+A5tSt
         OvAxXh9jNxr+jLoJZQabAsklEQ0tk9zb7L3VuewxfrTREu7t1pzQ14aRA7Qoj7e1tSqR
         cM7Q==
X-Forwarded-Encrypted: i=1; AFNElJ9PWwWGUje81oEUDf/uW4ff0sNAqihdwL8883PsgAygR5v47v1sDkYT7phqDLAEjDPHrqCiwgJJzjX6@vger.kernel.org
X-Gm-Message-State: AOJu0YzBI/zAfKfMfw7EOcQIJ5uuR35xUEJOWP3aPJ+8/CAO6qM3KkY8
	CQ2PoC/8ix7iSswK+Z71aSjy4lfFEwoR1+mMlipobNJetH+TH4rhU2gs
X-Gm-Gg: AeBDietyYdcZzyx27DJr4hnxuWWJ9j1rSOr2WTanOYTWM8zfk35jF9AogIdOXQa7oq+
	1zoEgfCCj1daLbIEM3xjQyiUXLTpevaAxbef/6fsA46YmI6lPix7aEBOjeX5fYugAH+Zj5r5cgx
	qAD6sSPj5YAY7q5VbhHjpGLGVYo9GMdxU33e6zwzIuVTiISZPmdmNwRUNzc+/XtLqnjHwHj/sLU
	Y8c3l550IxAzKmyM5uJkShjgM9+ONAqek3LazkcCv4ADqqVN8XmGtaqU7vgeH0wk29FRPNlZMgc
	0vexIA+9H9xU+mapivLE4AIEMd4Fa1pL0lcqtA5EfIy1fEW4y2AFGaGsZrqEMqFTKgweayG6KPf
	z2LANGNq33RSW0qzILuPHzY5bi4zp5WHxkdf/6tQZ4FYqXtuPii+Kvv4X2pZhp+CHsOMtLSdzAx
	4O3NDyl7jREHewZ6kKoJiIm4Ahlyi57Q==
X-Received: by 2002:a05:600c:a318:b0:488:a2ac:a340 with SMTP id 5b1f17b1804b1-488fb7579demr62981685e9.12.1776497171022;
        Sat, 18 Apr 2026 00:26:11 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4e4d525sm9959884f8f.31.2026.04.18.00.26.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Apr 2026 00:26:10 -0700 (PDT)
Date: Sat, 18 Apr 2026 10:26:05 +0300
From: Dan Carpenter <error27@gmail.com>
To: Maxwell Doose <m32285159@gmail.com>
Cc: tsbogend@alpha.franken.de, gregkh@linuxfoundation.org, len.bao@gmx.us,
	yoelvisoliveros@gmail.com, linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH v3] staging: octeon: remove SPI, POW, PKO, and Helper
 typedef enums
Message-ID: <aeMyDXlMrLTY9EgE@stanley.mountain>
References: <20260417231908.45323-2-m32285159@gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260417231908.45323-2-m32285159@gmail.com>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-14195-lists,linux-mips=lfdr.de];
	FREEMAIL_CC(0.00)[alpha.franken.de,linuxfoundation.org,gmx.us,gmail.com,vger.kernel.org,lists.linux.dev];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[error27@gmail.com,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-mips];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 33D01420478
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Apr 17, 2026 at 06:19:09PM -0500, Maxwell Doose wrote:
> This patch removes custom typedef enums and replaces them with standard
> enums to address the "General code review and cleanup" task in TODO.
> 
> The following enums are affected:
> 
> - cvmx_spi_mode_t (now enum cvmx_spi_mode)
> - cvmx_helper_interface_mode_t (now enum cvmx_helper_interface_mode_e)
> - cvmx_pow_wait_t (now enum cvmx_pow_wait)
> - cvmx_pko_lock_t (now enum cvmx_pko_lock)
> - cvmx_pko_status_t (now enum cvmx_pko_status)
> 
> This patch aligns the octeon codebase more closely with the Linux kernel
> code style, and will address the "cleanup" task in TODO.
> 
> Signed-off-by: Maxwell Doose <m32285159@gmail.com>
> ---
> v2:
>  - Appended "_e" to enum cvmx_helper_interface_mode to prevent namespace
>    collisions with a struct of the same name
>  - Fixed errors that were indirect results of the namespace collisions
> 
> v3:
>  - Fixed function return type in cvmx_helper_interface_get_mode

We're still not going to accept the _e on the end of
cvmx_helper_interface_mode_e.  Try figure out a better solution to
having two types with the same name.

regards,
dan carpenter


