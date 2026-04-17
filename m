Return-Path: <linux-mips+bounces-14187-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wHR0Lt8y4mkZ3QAAu9opvQ
	(envelope-from <linux-mips+bounces-14187-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Fri, 17 Apr 2026 15:17:19 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B227141B87B
	for <lists+linux-mips@lfdr.de>; Fri, 17 Apr 2026 15:17:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D8EA5301CAB3
	for <lists+linux-mips@lfdr.de>; Fri, 17 Apr 2026 13:16:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E69D374E4E;
	Fri, 17 Apr 2026 13:16:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R0j2okB+"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3041C2DC78C
	for <linux-mips@vger.kernel.org>; Fri, 17 Apr 2026 13:16:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776431810; cv=pass; b=LvhiXwxqgD9VGxaIYofjyqh4SQAT9tHRNhCukDVYslqFmiDnyJg8UpvowXYHJ1NBJAB6fPg3LikZV9+Ewp0oGUkT7hPjo443LeN+9PTl1EDN76qjEn3p9Gz7AeHjVNY/pa869QKIlcXRR3BFXbsbJlQa7D4xUOAyKkqW1tncVJQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776431810; c=relaxed/simple;
	bh=3s/oC2gxFO0+InhCcu7xTpMSDsPip0QFs52mALT2Uco=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iZSHNu4wzMGUjVCxZt2K8fg80Wjo269XDkFrx69Ln4jhH2dq4o6I+3AjuFEodH2ohd+TkdYnm3beLvHQlxyWxRKCm0S3lvEz+mEoMn5jnH6R7mNz7QXfWIyYqkdzC7GA4GwdKJhSvTLEIG2s/x0eysw166PvfxwFc+RfNvlwKes=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R0j2okB+; arc=pass smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-79a7109f568so7544797b3.1
        for <linux-mips@vger.kernel.org>; Fri, 17 Apr 2026 06:16:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776431808; cv=none;
        d=google.com; s=arc-20240605;
        b=emWLPZeLWlAx5WiQa/OJLUewPy+yH6DSnxP7xCpJwscphZoY/98FI0e6B1YLWzpKL1
         ULBxCqw3+1ZexqTHNY6KV4FM4c+22NfeEVe1i3juIx8lRBxeeGQOu4kNtsGY+RmI4Byl
         xHYMQbEdXK2GxCgxLMVgnhBvg2zSjJY7mjzY9ptxDOGYadTLzglSXXqyB3+Kdm33gTdl
         pkkYqGVpM2LIxKDid0iwa4hok5oDQhDjdt8OUugQsgqpAcqWvfub17JvJqgtOZkky2si
         iB7uwaQHvv2FI9bkZ9DbraSl5F+kXi+Mu77Ay2e54XhOGkweTqOqNohk+f3GWxarl6cM
         qPQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=x+nruM5WdcsT+s2FX2xDd+GGGup7vVQS/qf22af7xvk=;
        fh=c4OINXt0vMC6gKg5yK5YXAxXi0ard5B2Vwsi6K367mI=;
        b=P0aN0fKGfto9oY7iVr/L5leCGkkU3HpIjDtq2SbEXcoEglgsbOmHobe0S2ul/X02q+
         Q1tLPpiQEauM6Ln2MCbDqKVlwJTvKGEFKdJZYqtEZ5GRPSYaWgBQ3UP1CXsljGRGibQc
         +jEzlLbxZsQZKZBVni6BMF+oabFpDJ9An22u7JyF+zmXbl7aN8II0FiIG73iRChK+4sU
         oIZQlPUkJ2gARol2DG3WYLr9SIj9MXbf+vSUTFRz+SCKbKTneCR6OXIHvttOCFbJ6E/E
         Q2yhmHaTLKKs/2O84OAnGEXItHTlj89u2hDlIIcNjU32cwM/eQLWYCnLbF8GF6I3k7SL
         rNEw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776431808; x=1777036608; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x+nruM5WdcsT+s2FX2xDd+GGGup7vVQS/qf22af7xvk=;
        b=R0j2okB+yGHD7IE/y5ZYxYH3fYdG30YwgmglJPpJ+waEU21PNMEO8mwxEdZRJnJaUv
         AcBrBpSvlTckr1PqBWmM4tYr1iF5QpI4PYgzVDnIRrlbQZGUGxzgWnXMTxd8vIUjcmw1
         Dgo2Vms1P+i/3A2sj8V+CdY0u7hULm33XuckBpSuHV8EKBEmw+jdqmG6l7paBuhzX2Vz
         duwvgHPeOelsge+sb7dts8XgGakmw7cK9x5LTpw/lEQ2cjF93QjbQsL8qL44SfoMK+UF
         pUMzLntWPBXmwi4XSkebe08o01LCaBIjHcHKHOV/vF1VSzlMe0x6BpQqKLW6Va809PnZ
         4RyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776431808; x=1777036608;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=x+nruM5WdcsT+s2FX2xDd+GGGup7vVQS/qf22af7xvk=;
        b=Xb/avgbf6Ac012XLmQnNEF+o9aofq9o9Inux4EQNY5otvgUXM9Ypm14NfJnSVuEIAN
         Y06day9Phn2QcaON5WHZkJolac9HhSPELvzZAncV6EM0tEkHovXIjs0eO1m702sn9Kt+
         5qQ9KQ+yfEy8VOtz8hWsXGYvT0fvqBdggwdcQrbLl8+CqqPuvwuqUvbcrrXZWk/ylFhs
         VjPtD4d0wtvLUtARG4YEgokHsNKuWUVZet3nLuHGoFnm4rZBXt+DW8W12zqAQ0bMgW7n
         G8P54gXDAoCDsAdghnSAftSwZHAHMn3htjyYfk084W9OJU7I9OT9/XGtjoUbwt9D+5JN
         vBdQ==
X-Forwarded-Encrypted: i=1; AFNElJ/gjxf0vjJc26tkPz7qWp64Q9SfUaBRFpC+ZHi0u4ljf7zuffGxurdEhEBHhKYaokY4QZGe70l5WtWE@vger.kernel.org
X-Gm-Message-State: AOJu0YwbY9vO9nwA/T7cN+sERridfmzN87eGCkePz0PYn5XxQZCYwRIX
	9w68H95JuY2Fj8Gf6ZlwpxSXy88DV2HilccK2dmMZlDsgukrgCGgePxYSo9Qt5+UgNE5h2NnyAN
	lszOQ2YE3WihnGu4wpH7hFixCXRQIbpM=
X-Gm-Gg: AeBDieupjNYbiz15EbKrKsLchJbsahDNJ+1DQplW3UBRmErqAsVd8FW0Ue7MLFJ8Qzn
	oEqxXbyFCgS69oBBhJdznBKPDJeQk603AyBRwZHVUFaQ/CtRIbuGOpNBW+LP709KUUci12+h5KF
	lx1B1/GrQ5nLKtW/+THvRQL+esjHTc1q9TC/DLPTgCgRUI4J2JB+0b+2GNPmv/K6rJa3872qe+x
	8GRQga6a8U5DMIxAsBLJO4cjnZnxUvItJQk5Tqsph6A5XdF+5XjV4s17XfPH3BEfP4CgJDhZq65
	twaMmjH/sR2BbdldZVpX
X-Received: by 2002:a05:690e:d59:b0:652:5567:b408 with SMTP id
 956f58d0204a3-65310869318mr2273093d50.26.1776431808068; Fri, 17 Apr 2026
 06:16:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260417023602.112359-1-m32285159@gmail.com> <aeHERE58gSbAe795@stanley.mountain>
In-Reply-To: <aeHERE58gSbAe795@stanley.mountain>
From: Maxwell Doose <m32285159@gmail.com>
Date: Fri, 17 Apr 2026 08:16:37 -0500
X-Gm-Features: AQROBzDE4fwvUAcvG1BxbCof6C0YQgw_F8sU6xGyy5kWPzV7c0WRMlziP1U8oBA
Message-ID: <CAKqfh0HaG1fQw2_g9P7wHPyqib05CeyPcTVQREYyz4u2xRgbQw@mail.gmail.com>
Subject: Re: [PATCH] mips: cavium-octeon: remove cmd queue state and related typedefs
To: Dan Carpenter <error27@gmail.com>
Cc: tsbogend@alpha.franken.de, gregkh@linuxfoundation.org, 
	linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-14187-lists,linux-mips=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[m32285159@gmail.com,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-mips];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: B227141B87B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Apr 17, 2026 at 12:25=E2=80=AFAM Dan Carpenter <error27@gmail.com> =
wrote:
>
> This should be two different patches.  Is there no way to move the
> variable declarations around first and then get rid of the typedef?
>
> regards,
> dan carpenter
>

When I was test-compiling the patch yesterday, sparse raised
a "should it be static?" error, and that was resolved by moving
the extern for the __cvmx_queue_state_ptr in the header to the
top of the file.

best regards,
maxwell doose

