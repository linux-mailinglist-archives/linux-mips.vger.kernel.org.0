Return-Path: <linux-mips+bounces-6779-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D55159D3E85
	for <lists+linux-mips@lfdr.de>; Wed, 20 Nov 2024 16:07:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9AFC62851CB
	for <lists+linux-mips@lfdr.de>; Wed, 20 Nov 2024 15:07:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACFB51DE4CC;
	Wed, 20 Nov 2024 14:56:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kjilPNAY"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10BDE1DE3B7
	for <linux-mips@vger.kernel.org>; Wed, 20 Nov 2024 14:56:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732114589; cv=none; b=jAozlrV0suAnPtachMtkwXhK/PFUcdveh0DAMAHzRcL8t7wN3b6xG084sPD85S7Z6A/1/W0oj9c1E85LaOAdWtQpxKCp9o4Q+34SHeoYQUGRy1QI5RHFDedZAMNmystotm2q/qo+ChaOUnS/+50EuXWfLmOuBMauAcyAxn87WjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732114589; c=relaxed/simple;
	bh=ZV8oTG9hXdzwLiwMFIq1XbskTEGAPzhFy89n4zeSOsA=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=uD/x2xUf3m0tnbKtsKldjSVlGGMD5zmvbcStmCz5vmsLpEDFFaaZ/73zgVY2Oygu3K+L8d0vvyLpub6xotwdY0HgYIZIcKxTQKZi/DKbjVA8PXLtzLJj4MUHGzpkz1gjeIt3aQr3ZCUE+gqHf3LFIEMwFNx1klx1qng6/n9hpPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kjilPNAY; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a9ed0ec0e92so613196466b.0
        for <linux-mips@vger.kernel.org>; Wed, 20 Nov 2024 06:56:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732114584; x=1732719384; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Ga4EmK4rbZP6vFgcsob797k4Q4zC+xrLc9Q2B/N9wmw=;
        b=kjilPNAYaKUxit7O4YLyP0dPxCwhRXsFKkw14gxi0e/Rms+r6aIlSw0EQzCMNLejKu
         rVZ35999X9/X8j2G/fzwcRrvShnjI5icUO5hZIg/gzQ+0zYuh9W3HxQ4v6Ma8rTJ8xsL
         SiqWxZweoNdsepRTJldPGrSNS53HhkucO8AIkckoGHHg4jori2czmW+xgdGp4x//a0Re
         4Gi0LbrP56qSmSrP0kurtZFnzDshsM5lZBHN/vuP70SSuhevIFM9EgXUs8rf71iKyHjv
         Y64HRhwoEC7HZi5fVADUhAV5uN1jFxB62IiKMnW0jycR4DRkIGtf7A9mBWFiJoKJYpdb
         vAIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732114584; x=1732719384;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ga4EmK4rbZP6vFgcsob797k4Q4zC+xrLc9Q2B/N9wmw=;
        b=aln+JmDN7LdDBD4UCN87hrqeSYmeN1wcvlP9o1CJ2qb9VQgt+Qc26pq3qnk5JOMIOR
         uhHPBI80HALCzylvPqu3zkP1L0cSDIOeHk2pRUsvKmFapbu5n5ZhIgLwlRX2S97t9oHG
         iU01fDZFStgshKg8ky322RL3d95MwY0oziCFTnEGz5b3E4V6PFHBO4NZAYkxa1Qww1m9
         qOQs91OpS5jN7qtn59pDf5VAcKXR1Oop4g0+p67H99/LwMWwcH3w7+NWb+q9agvuySgK
         WoEmx4IwdhOhNQexIQmU7B3eUER7aYIyqN5BURCTI50m8yC18uxl/FRJw9ncmhBt0y/N
         HzjA==
X-Gm-Message-State: AOJu0YxriP33BR/igL6if5w1kJRA+WxBYeAL/yjJqfwdI8ayvZg5YX7a
	PNOWtIa6cqBjDybHZBXEaWkOAwV0/RoEFlsmW8hUAFsGVRFiOWVuxtSOwH8bTycpzndtTqC9ENB
	4xzDxeHso8fN6RhAWETNGHM3eWFOfgF/p
X-Google-Smtp-Source: AGHT+IExJG7pO2kr+Vyaz78dWZFqUNP5OsIf8GRIg2VtQ7X1WulRguQzF9LS+72skG5zttbkR9ymjLYRl1QJzHOMYUA=
X-Received: by 2002:a17:907:7288:b0:a9e:93fb:3d5b with SMTP id
 a640c23a62f3a-aa4dd56a855mr300826466b.19.1732114583683; Wed, 20 Nov 2024
 06:56:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: DiTBho Down in The Bunny hole <downinthebunnyhole@gmail.com>
Date: Wed, 20 Nov 2024 15:56:15 +0100
Message-ID: <CAAZ8i805wy3Phb2hjEahkz0arsT2hDhVQ2FE9fsM_r54BDYfrQ@mail.gmail.com>
Subject: MIPS32R2 Ubiquiti RouterStation/Pro
To: linux-mips@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

hi
I used this router with the old kernel 2.6.39, which I updated from
time to time until the first kernel 5.*, then I stopped using the
router.

I started using it again, and I have a few projects in mind for it,
but I'm a bit confused by what OpenWRT reports because we always
stopped supporting it, and I cannot find any new patch for  the Linux
kernel.

Not so? Are there patches for kernel 6.*?

I don't care about the userland, since I am supporting Gentoo/MIPS.

Please let me know

D.

