Return-Path: <linux-mips+bounces-14157-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wAS8M52T32kiWQAAu9opvQ
	(envelope-from <linux-mips+bounces-14157-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Wed, 15 Apr 2026 15:33:17 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EE50404D4D
	for <lists+linux-mips@lfdr.de>; Wed, 15 Apr 2026 15:33:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3441D3022FA7
	for <lists+linux-mips@lfdr.de>; Wed, 15 Apr 2026 13:31:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 061513AD53F;
	Wed, 15 Apr 2026 13:31:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZY2Unzi3"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE87C3A963E
	for <linux-mips@vger.kernel.org>; Wed, 15 Apr 2026 13:31:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776259883; cv=pass; b=IQBbPf7ikoUxRPYYbMJQ/K6YqNLq8OU5vgkeaLVKSfICfsd+Rr0oEJtsWhYlwOux4YOCkKVIkOYAGsaIZbd39jYjOrX+1GflKZwsAv7emLbm8Zy/RSK+//55bSaG0i6BpDeI5UBm91OMkud3dF0D2Qe9UzXM9x4/p6LshtqFiG0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776259883; c=relaxed/simple;
	bh=lC0wURyXAz69bWv4J3Sezq0K2X3Om6r1orhscUgI2ew=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=clgbZ59QovjsVE9GOBwVTT0zalD2qCOq8zpAqW36Lwq97o9MYI97RxN9odnzZ/iUXcdqpgNXUkSKOpNY7nVh34455FCps7UwYToY5vxchUn/72OaHrOVDUsxDMELhiLr2ddD43oLTEmHS881FkYK7OZX/AyMQHKiUR7A9hknPmA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZY2Unzi3; arc=pass smtp.client-ip=74.125.224.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-650789b22e3so7742942d50.1
        for <linux-mips@vger.kernel.org>; Wed, 15 Apr 2026 06:31:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776259882; cv=none;
        d=google.com; s=arc-20240605;
        b=dTQGFDfAdEsvH1DWx4nFeIWgXDxsCmuDe5g33CgiAsszIMkLgtYMXlOjrZaS91lXH4
         zxRvI3tbbtF8zW7KD/xqpBCBRZ5GgH0UA/5wRQCc0ZHXMqbErvUUhlhojIodpsYtQgw7
         /RlIui4hiJNxGWwBoGrxWf/1d3ozMDD5EHbyD2ZWikveXIpkSCrJS6NU5EDVqDvlDu0m
         EfvNzc5Nn6Xb+J64p7pnEYtlL30RWXvoZXe4LDqT8yfb7mQsuMkNv+XCOx4W4EVdeIDu
         LrkLZrbmL5+gMrmYvmlW3blFgV984loEk/ZaPzi6uKTuZTdl4vWE3/ybvYZr7vDhVU7h
         9sdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=aiNIbmZ4B5Zir9OP8ysiY4IaePW7fiJTfDRuMBJ2dRA=;
        fh=vhcQIQXUrViIqUSYSVw6eLFL/tc5nNBE6A/2BVlnumc=;
        b=Y11CFGUi9OH4/JIVIUAJ06hqT0+ApwzNqnysvqDlk9aDeGebag6V9rxpCTkrAZGk8a
         G/Lnd3pqlPciOL+inpehB0oybOvkXrITw7PYyAoUofgzZetuwEA2uDAdjwqbz4zCRcc+
         zJ7BttRmFeDnCVfMy4zsLecLkcW+/gV+bKZZeDeUv/s94PcMthd3imNXkIcV7zFaJZXQ
         t1bKMYcNBsJlJALdC4sLdp/LB2XxC/JZBL7PE7GtlsNkwPNETgt1NULcygp2vwarE/+u
         hUsQP7pMwfiqIAcgRWl41rSY7pDVVH3zsAWASo9WQrHduRUh4lBRs9HpkczuNipe+K9A
         PLZw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776259882; x=1776864682; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aiNIbmZ4B5Zir9OP8ysiY4IaePW7fiJTfDRuMBJ2dRA=;
        b=ZY2Unzi3NQY4myXlT0gZuZejg6OF/wAFUNOQnKsQG0DP3AGmGc7df3Be8ZRRdH04Gt
         DvspkTxAZ7iW7aZ/rqyCf68Q77wVYps3outxY5ipdmzQcM9bvN3HF/j/F77rOpaljA40
         MCdwXeZNcW2ppvhYDBGeRWJYXxgaOuI9CQl9Id0MXRARwejumNnLSh/S29kUN25/sjs9
         DL8RXL392Rk3zaJaxYCANxZK9igZ8ILtNiCU3TGNiQr3h9M+PnNB7iYLlwe46PHRemoh
         N1cQSiBrlQBU5tafalgTOeyqrqICVLnVG/hFiHrLT0p4VE4x4AN8u6xLppexd9xooyhC
         SdxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776259882; x=1776864682;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aiNIbmZ4B5Zir9OP8ysiY4IaePW7fiJTfDRuMBJ2dRA=;
        b=ItN2kkFxtc/F5eQQvKjeXqdX0G0ifC4lWkdOLUq8Z7z+hWz3nIt7MiL3i2YVGSyfPJ
         ZOFI1uZ2sHRRGY+SsoLnG9yUVVbEg2iyJXkPExUNPfMnEzcyKL20FDLgAhDgiWOsbYvE
         4mSjhwQthbbllntNZVllgM2DSuJmGhKbZ1zJ0xbqQbBoVA1GMyrwjudiy1PuXRhb3rI+
         7ViyAvhc1QvLf5nRQJPTMFK7Hspxfx87tGb2duoSGElf6VxOkqal+ngOCEqsGRV82Zoh
         jz5b6Z/4VmC19ne3VAtoipzlKv7XfJcQNSeWL2gM43Uf/ZsL7Ft2xli1kjk238StnCYd
         iMvQ==
X-Forwarded-Encrypted: i=1; AFNElJ/OVyE2yw9lR8V969vCEGXhvQVnWZ4f9RiqFQU9JixdGqMRo7apRv57gNIv44XdVcI3h0kc3JBmrcmb@vger.kernel.org
X-Gm-Message-State: AOJu0Yy360CZO+uwrTdQTz1gHokJmsMajMRi2qWS07KNIYTtTWEQ2vdU
	/CsIRiBFzet4Tsz5Qrd2o9Z2cvbJ9VDJjUrIn9UwRYJ7PF9yAUjZu3T5HH/XnGgvscJPtYutDz1
	ejxVTdySfHX3mHTy2H/2M5HVeXCi8Imc=
X-Gm-Gg: AeBDieswKX1PDc1hRYOjrBt7gdU0RVrnI6PU0LabDg0QGfDZ/+DZTOolnpRCDYwlSvM
	udasP5crk+d3FqTv5aqdUKP8bPc6hVSP2sOM92AooXlYc6VP3l5cZFmLA/IoasvXRIjCEOOs6R0
	mGWA5Rz5triXYwzn8KLQhdU0E6OefiIPujRr9V8AbQK36/U7AoBRDVJUHju/9iVsV9+mm/J0ipy
	cGoXku1231zwMgo5WsdOG7sUYJkcES2NUWTOVfjlSzdKmSY/sN4cMFzrFF+tervPNwm0mg57PRu
	M7+NKE2SmFGhwcolWKmZ
X-Received: by 2002:a05:690e:1441:b0:651:be8b:e87e with SMTP id
 956f58d0204a3-651be8be93amr13590889d50.34.1776259881634; Wed, 15 Apr 2026
 06:31:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260415122939.77847-1-m32285159@gmail.com> <ad-FcZeXsFlSPXQj@stanley.mountain>
In-Reply-To: <ad-FcZeXsFlSPXQj@stanley.mountain>
From: Max <m32285159@gmail.com>
Date: Wed, 15 Apr 2026 08:31:10 -0500
X-Gm-Features: AQROBzDCVgshR0QY4mUa0slX2Xn2OyKuTOQxV4oq6LCHOwNRLSzw7gAYWraCvnA
Message-ID: <CAKqfh0EEvEwF3QmgtNk2znsaamGFCc0muGjY3zsH6OogsZS8-Q@mail.gmail.com>
Subject: Re: [PATCH v2] staging: octeon: remove SPI, POW, PKO, and Helper
 typedef enums
To: Dan Carpenter <error27@gmail.com>
Cc: gregkh@linuxfoundation.org, tsbogend@alpha.franken.de, len.bao@gmx.us, 
	yoelvisoliveros@gmail.com, linux-mips@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-14157-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[linuxfoundation.org,alpha.franken.de,gmx.us,gmail.com,vger.kernel.org,lists.linux.dev];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[m32285159@gmail.com,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	RCPT_COUNT_SEVEN(0.00)[8];
	FREEMAIL_FROM(0.00)[gmail.com];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 5EE50404D4D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Dan,

> Presumably the "_e" stands for enum?  Ugh.  No.  Don't do that.

This was because of a struct with the same name, provided there wasn't
the "_e" suffix.
Just curious, what name would you prefer over appending "_e"?

Best regards,
Maxwell

On Wed, Apr 15, 2026 at 7:32=E2=80=AFAM Dan Carpenter <error27@gmail.com> w=
rote:
>
> On Wed, Apr 15, 2026 at 07:29:39AM -0500, Maxwell Doose wrote:
> > This patch removes custom typedef enums and replaces them with standard
> > enums to address the "General code review and cleanup" task in TODO.
> >
> > The following enums are affected:
> >
> > - cvmx_spi_mode_t (now enum cvmx_spi_mode)
> > - cvmx_helper_interface_mode_t (now enum cvmx_helper_interface_mode_e)
>
> Presumably the "_e" stands for enum?  Ugh.  No.  Don't do that.
>
> regards,
> dan carpenter
>

