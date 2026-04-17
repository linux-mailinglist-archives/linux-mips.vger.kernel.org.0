Return-Path: <linux-mips+bounces-14184-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gMRSO1LE4WndxwAAu9opvQ
	(envelope-from <linux-mips+bounces-14184-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Fri, 17 Apr 2026 07:25:38 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B95ED417116
	for <lists+linux-mips@lfdr.de>; Fri, 17 Apr 2026 07:25:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id EF12330247A3
	for <lists+linux-mips@lfdr.de>; Fri, 17 Apr 2026 05:25:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 020BD361DB1;
	Fri, 17 Apr 2026 05:25:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X+RQ6/lX"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A258E31D375
	for <linux-mips@vger.kernel.org>; Fri, 17 Apr 2026 05:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776403531; cv=none; b=QtgFQMLSScIGzVTkuBqfyBZfN5NgUpmKJZiFZ/gDzL+Z/o1OtWrCA5Fg1zq6GjZMps4wjYvfPajh1MHv+fl5C/BbaVHsbc4FHOTAMiN0l7ggFK9+WHovB0K7oDBc2Nxj/KWa2/fGP27YxpTkI2Z+6wSOqcqCbNjNOnTIIdILiWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776403531; c=relaxed/simple;
	bh=ewSRNKHD3tCT/saduSwvvYMg/lug1Tof1ThFhOaIBv4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gcG8fVbJikDTTmYq0rPRo5Ux8bg7jNOu+3834MSQeZ0zd2ghhalmWewPaRAFgmspLq9skZZ6JzkgCHAeEglbT9kkv2lvj30ndCG7THfqUm4x9oJzPZK51XUGer5idjUwb3IyaoIuxEZZNUzWgzzBJiz7INnmZ1oHitJ10sueUTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X+RQ6/lX; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-488e1a8ac40so3262655e9.2
        for <linux-mips@vger.kernel.org>; Thu, 16 Apr 2026 22:25:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776403529; x=1777008329; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pBOcs8If319sZczMI7MZUp1nUcUA46ONaU7CO4kO+eQ=;
        b=X+RQ6/lXYjkSiOdLsxJG2UwajdG6BJxibMmzMHjSiGyHt7/jDwaM6e/Nw//IGBk3VZ
         2Qjrqah7gyuZe2UDEp6SK3d1RrqSgo/9dwzkCDLoBnF49nqCWwZmjbDwN/+YLOKHwMTz
         2IvkECwBtyjdNqBa9wziD4Dfq9lgcgu/Q0sYOvHK5o7BJPP4+dCcanqOMwpfItLWrdPt
         zZyg257Zk+5cu3CPdvdKmCoTXRWW+i/4dLICI+tpQLxbm32cRlBdz7YI4Z9t+cf6HU2U
         tBKJ6oROvyyaM3W0NrgUGC+QhrCxR94kanWTR23tJzt8W5MSVNYTST5qGj/BMz4A+iOU
         j1uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776403529; x=1777008329;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pBOcs8If319sZczMI7MZUp1nUcUA46ONaU7CO4kO+eQ=;
        b=plAm/r0LLNa1RF8E0wNEYNgdX1PwEyty7j4qAChEOFtrSm4EIbnsIhhySNEXEuH+Y7
         iVtrai+U2MLK5WSp4AtKqQFP5THOj6TJZYgn9nFdUpwTxsK0l9jRmHzyObhMFTNecGCO
         RFZpBqZv1rZLlZmmwWm/rahCb30TBQLBJlCY58a+jJHZJqbUPpOjgQChBec8HV4qMUfQ
         XhN+dYYeBcet4Qdw3wD+ysU+UgQglLNJBqj0AdFIvmgXV/BCNNRQXjqBq4ikM1yldyTI
         inaRDuNQxeh685qLEcd2IJKDqcT4q/4KGKEGVmaau08p72iLPnG3VpvE6tVi+dg8fl0z
         Hj/w==
X-Forwarded-Encrypted: i=1; AFNElJ/pf0uVAQz8CfOJlb9GfycwjWRxZ3WrjoMtdTM3CizxRg9hXPmw8tBNrHQCEG8OVw2r/bEAbFr/RD6g@vger.kernel.org
X-Gm-Message-State: AOJu0YzxNN0O/Ti0SPHYQyU4yp08uD97zrlJdnRM6b6uTlOMQU5oR8og
	94vEu1ASXJNJCa7R5O9R9N19y34kc1kKDp5bQV/iTSHzKJk1GG8lj87M
X-Gm-Gg: AeBDievxfnJM7j6SwwPvRpXEU+jD8VUfb/2he7L6hIyBE3uAm14VxHppoJLgU34GK52
	A7TDDrcmqEemMiP42ynIPZXF3ydJVbJ66vXgXzmy3gRaUtOx1Smc2cPfglROfQpIEp6VOr+zBIQ
	7+B8eTGNhIKuzpKhA01U/U1AHG+V8z0Z1H3OZQpMjvLA2Uh34hlvrYqXTTm1SxN8TEA5PP802L/
	+5v+ldvnXVFmqrU7GcmOOPx8AAfTbr2CZHK3HzCek4f1Dq+bl4wqCHzBwEeR3hVR33e5SyH2L2S
	EahVzimcEAgIy+KWwbztQVG8RmPeTmzUdxBi31f9flWVhBz3NVV2g0by0lc5PWU5rA/B/hirpwj
	iBARg0ze/EmjQAcAJOzuDVMTGSQSGkl33iAtJDmuKFZWrauUZua6NZS2fsWEy32AB9fQMDd+25f
	czITZOusDubCU+RIiVH3AgtUB7JHB/0A==
X-Received: by 2002:a05:600c:4750:b0:486:fdba:f5db with SMTP id 5b1f17b1804b1-488fb6e7316mr19178335e9.0.1776403528847;
        Thu, 16 Apr 2026 22:25:28 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fc16f93dsm20285885e9.3.2026.04.16.22.25.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 22:25:28 -0700 (PDT)
Date: Fri, 17 Apr 2026 08:25:24 +0300
From: Dan Carpenter <error27@gmail.com>
To: Maxwell Doose <m32285159@gmail.com>
Cc: tsbogend@alpha.franken.de, gregkh@linuxfoundation.org,
	linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH] mips: cavium-octeon: remove cmd queue state and related
 typedefs
Message-ID: <aeHERE58gSbAe795@stanley.mountain>
References: <20260417023602.112359-1-m32285159@gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260417023602.112359-1-m32285159@gmail.com>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-14184-lists,linux-mips=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[error27@gmail.com,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	RCPT_COUNT_FIVE(0.00)[6];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B95ED417116
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Apr 16, 2026 at 09:36:02PM -0500, Maxwell Doose wrote:
> This change removes the cmd queue state typedefs to work towards the
> "code cleanup" task in the staging's TODO, and aligns the codebase further with the
> Linux Kernel Code Style.
> 
> The following structs are affected:
> 
> - __cvmx_cmd_queue_state_t (now struct __cvmx_cmd_queue_state)
> - __cvmx_cmd_queue_all_state_t (now struct __cvmx_cmd_queue_all_state)
> 
> In addition, the global exported pointer __cvmx_cmd_queue_state_ptr has
> also been updated to use the new names, and its extern statement in
> cvmx-cmd-queue.h has been moved to the top of the file to satisfy the
> requirements for EXPORT_SYMBOL_GPL.
> 

This should be two different patches.  Is there no way to move the
variable declarations around first and then get rid of the typedef?

regards,
dan carpenter


