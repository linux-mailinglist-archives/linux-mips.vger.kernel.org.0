Return-Path: <linux-mips+bounces-6113-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B9D279A1DE7
	for <lists+linux-mips@lfdr.de>; Thu, 17 Oct 2024 11:12:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BB46A1C25B7E
	for <lists+linux-mips@lfdr.de>; Thu, 17 Oct 2024 09:12:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23E421D88BE;
	Thu, 17 Oct 2024 09:12:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ImV5Yxov"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8E611D89F7;
	Thu, 17 Oct 2024 09:12:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729156350; cv=none; b=KOts0WrIiDaW1X8B51burhQTGxKuTwOkVcfFvDjSpTLIsbj/vI6h7dbPMGW9b/M9RoAKSti0YINRbaWdw2tdcNng3mJzF6QIQset5SEWzZW7OiceK8x7I3LecN59sz3uz7dziujtaPJ0VmuWe0MfXeCQMvFHj3iPBEZJZcTid+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729156350; c=relaxed/simple;
	bh=VQKpQUPLP6jDrGoWhK5yRAaATy3xmktpnMBji+kNj5U=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NNqROlNgj5iaZZZRm6FkUWw/vCGU8emg3dC6I7g7WtdebcndVtnnxsZ48IUPAmxUOLEkmaRRtQRCykrixkeN9O5yuMT0ULKy8tZp3yFTlijr+jgTOziJxfnT7UFQuCpoPicgfX6A/9P9kmwIy12D10Wd8g9jTfhTNXCgnPCpm2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ImV5Yxov; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-20c7edf2872so14517225ad.1;
        Thu, 17 Oct 2024 02:12:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729156347; x=1729761147; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BlXoQm/yFiDeheRocrn0VG+bRjvZ3nOq2vlDgKl6468=;
        b=ImV5YxovbBG0V3Mywen/6mXOSbQStaLZzWHgwK2BaCLLzMyOHx7bRFCJQefLeomqRa
         KmFpYrSSIBh5qBFK5g9rfiq59BGMcf4EEA+hPQ9ChpU2CcLKuzDq+flvXtm2JrIePbDw
         28VCtrMOuFrL03dJZUxeoEoU+DzZQej2THeKynjWLoQHZx5NIYEmP6igXZtsSTAZwWT9
         SPPtg+AbSL9jPqsH2fPyWJaSDxADsy1Ys6puuqnU+SESMu+UMT8Ahb3lV30ENd+TY8DP
         NEcG9TeGwxTbSwv0zoHzQYIC6W2mR1fPdS/P706dXKl3IAj+YAJwto/l+kteOVccACLO
         R2GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729156347; x=1729761147;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BlXoQm/yFiDeheRocrn0VG+bRjvZ3nOq2vlDgKl6468=;
        b=IkRxGGVfkgFLea80LjMATHKTTTvIWmPucas2eAj5oPgmG0E7EZPwJQYeHeM8FQxrT6
         YDxZfDjkgrtqp3mB9+qWYn1XrWKaXQ6xUlM5AzCufuWQhXqq22U0e2Ys6QD34anIjm9s
         +yMJoLwrAEWqEz/cI2A9SXeiBbevELNcTfnt/9R1FBAoQkyL3lCx94ZmNa/Z6nEbXuyk
         MpBUGbwoGehRHfMBE83hpv1Qtmfj2q2OgVlz+c2bYs9q/TcHxOu2EDstYhmPIuuajcGU
         F2LY1sDzkeEJMaVepL/9i18BbMOc8MilG6efWDmChBjWG4xk2nhpfm5m59Dovl4tWXYd
         1pLw==
X-Forwarded-Encrypted: i=1; AJvYcCU6FAW/WG+xsMhWT35IWP/dyA1etoR5LvVQYp+7Fbrxe8MUI/jCUf9Nw5thyuuEEv1nbVMxkOuX760NrQ==@vger.kernel.org, AJvYcCXhFSVS0SI/C2jdI7lOOQXPUEl0bszskZTWG4aj4hrU5j6ywFKk0biSthxs15IcOcqiSvyhHt0L1P7KB20=@vger.kernel.org
X-Gm-Message-State: AOJu0YxoyX2ZUNJXcQqv1y807LQO1sph7/ZejvHIj/3opP4cGzZME1o3
	RuY1FgqD2aepgB5d10pPzGI1ikHrHrZ9VPfqpXHlt7PiXTfDg0bu
X-Google-Smtp-Source: AGHT+IHMujc9ZkKY1eItePeJedaKgn8rxEpnC7suJYuriBSZGXj/H+kLKY0lhafYYueqaqavzaq+bQ==
X-Received: by 2002:a17:90b:4ad0:b0:2e2:a96b:2ccb with SMTP id 98e67ed59e1d1-2e3dc20b4c2mr3642036a91.7.1729156346790;
        Thu, 17 Oct 2024 02:12:26 -0700 (PDT)
Received: from mail.google.com (125-239-144-11-fibre.sparkbb.co.nz. [125.239.144.11])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e3e08dae1asm1335530a91.33.2024.10.17.02.12.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2024 02:12:26 -0700 (PDT)
Date: Thu, 17 Oct 2024 22:12:20 +1300
From: Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.com>
To: tsbogend@alpha.franken.de, bvanassche@acm.org,
	gregkh@linuxfoundation.org, ricardo@marliere.net,
	zhanggenjian@kylinos.cn, linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re:
Message-ID: <ZxDU9HhXvEY00lki@mail.google.com>
References: <ZxDURnNKjNOgvPtJ@mail.google.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZxDURnNKjNOgvPtJ@mail.google.com>

On Thu, Oct 17, 2024 at 10:09:26PM +1300, Paulo Miguel Almeida wrote:
> linux-hardening@vger.kernel.org
> Bcc: 
> Subject: [PATCH v2][next] mips: sgi-ip22: Replace "s[n]?printf" with
>  sysfs_emit in sysfs callbacks
> Reply-To: 
> 
> Replace open-coded pieces with sysfs_emit() helper in sysfs .show()
> callbacks.
> 
> Signed-off-by: Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.com>
> ---
> Changelog:
> - v2: amend commit message (Req: Maciej W. Rozycki)
> - v1: https://lore.kernel.org/lkml/Zw2GRQkbx8Z8DlcS@mail.google.com/
> ---
> 

Apologies to you all. Fat finger from my part (and a little of mutt's fault too)

Will submit the patch shortly

- Paulo A.

