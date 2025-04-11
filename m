Return-Path: <linux-mips+bounces-8568-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 14F1FA85FF0
	for <lists+linux-mips@lfdr.de>; Fri, 11 Apr 2025 16:04:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DB51819E19D3
	for <lists+linux-mips@lfdr.de>; Fri, 11 Apr 2025 14:03:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF5FC1F1921;
	Fri, 11 Apr 2025 14:03:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="PO8AItXl"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6AC41865EE
	for <linux-mips@vger.kernel.org>; Fri, 11 Apr 2025 14:03:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744380217; cv=none; b=nOTLLvI1KJCbL40zdsdO1+so8aFVMJHZgYiZMduTrbMVZDeakxtC/eclKnV0TD8GZMBPTI29N3pGiNvTmCQ8VSJ7n4TYj0MHucc5LkgLmcaJtOMuD6Asp5AaW07bjJi/UUejrxGh5MJqHpL8k6arl2d0iFei12B5XQ7DyQ/mnZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744380217; c=relaxed/simple;
	bh=+B3dssbzQ0T+9tjtOKViLG4iLIBBnTTBP8+6J/vDyXE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EW4esSf3hOCB1eXXZl8K9AcLcm1+9tmm/Fgo0dPN6ERQF88g9LnaWaWR9EgY55AOVdyhVTGu+elsP5zcESxCjgePh7YJXV2C7c6luM6DasUxTY82lyn1AnIYj3f51YbC/+cEBCBP2SRD+f90CBXAGrkdluWfM5AltW108KxnOCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=PO8AItXl; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43cf628cb14so21837275e9.1
        for <linux-mips@vger.kernel.org>; Fri, 11 Apr 2025 07:03:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744380214; x=1744985014; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WjHI8iLKNyjSer6QwZ0T4nLrTbVuh8PFv9EW9BoptFs=;
        b=PO8AItXlpHlJXYohYpQQKAom+Aj8yHrwLKVt2Pq5132DqhU3fHsva95bVqy03fzPbo
         t2NJ7R5VjOL4tXUJyOZK5c1vLuOoHs2EfOuMJ7Xa9A4xfl2b+yHY2kkhDNes6HhOYNOV
         BATSPjFmiq4BnkoT53wR+xdCHK7L/Di841TFU1eqyAkC78udk7KzbNv7r8MtPGVzQA57
         WvDld3xfOVSDA7/CTfMzdyLcK7A8K0ZI6DNhfqhhLrxntZizhZVlOFHTEThGgLQmj7tX
         IGNq9Be2HaVMZMdMq3fATgJpFf/XjBFrBQnVQz2fZnOTaC/d9Zm3rljIDlw0Bvdhr7Kh
         AmuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744380214; x=1744985014;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WjHI8iLKNyjSer6QwZ0T4nLrTbVuh8PFv9EW9BoptFs=;
        b=uxb2KLWTxaFbyIxeh8iVGfNysnTM9eSt8f8qG84mSOxLyu61Xe/13OJqd6WieITuTM
         U9K0CzYq9j+MXiSbkS8q64rzVJ0/cDr7zgRC++nNaax4R/UmLDQANE1rN3VvezKeyZ8f
         tNPzpSpYKlnTFBWu6DAVY97nbTsyfCmNcRf3C8v7OPLvZ4Q2+2QnCALhGTqFC8tVWfaZ
         3tivncKBvt4aOEluTPIx7uFrgGb1bQe4pbBReill22tbbV2hpqFyVCkHgPUwLV4M/JaW
         fDMDRIK+SBO6zMqq+9PYVEd3meTMyh6h0Q8yvM9UR2fBdNZUjHnoCBNmcKHRC6B+Urio
         nRQQ==
X-Forwarded-Encrypted: i=1; AJvYcCVUgXPxTkWNhPukDbkq8U4Xgapw0d9BpF+jsODVtLAGy7ARzFyQI+TzcfHoqcoPZpReAZH8K07eUAoW@vger.kernel.org
X-Gm-Message-State: AOJu0YzcdIzNkFJcnaiKvogxACGcth+Y+iriacC85HesMAfSuRwoRD17
	Z6dA9lwDAzC8nzCUxkJAsvfEWR04XG2bqgTuPme9K6opJjAv/cjzfMLjIoihTbc=
X-Gm-Gg: ASbGncu9SPshnXsdJzTafC0CysSIvuFNGs9q+JMse+ThVAUB0iQXEUIPGG6xgEs+bpv
	qVOSPI0H+TSzvWKaZB1mXyJOw6geRIQKxCdNhbMSaZOEIzWyheSxNu5ZJe6PFmgLBREEAlI8CSu
	rytX2RpYhZ4Ca1T/dnmLb/2tWxyr9KqYl1KcheK6Nlx7/HVfEEAJG1J6R5H3XItnBru+9OXyG9O
	Ll2WXgFm2Lp1caRO/MJr63iQ9iKtQSOe52k27IwS7hwU541288XwtwiVN7kl7vaKM5TfWIvmfqE
	F1zmq2j4VU5AVMQ/g4oYjWqk5zM5Ip+sVdhh9mU0tXGJKiYPThAoAbLfjN1fvMk=
X-Google-Smtp-Source: AGHT+IFNQChJHGwm0jpg81EkuoYc4db4lN0W2dHhvYnddiYay5Ou28lyQpS+tRSobcbaI0Z86YjbrQ==
X-Received: by 2002:a05:600c:5112:b0:439:4b23:9e8e with SMTP id 5b1f17b1804b1-43f39622947mr26940535e9.3.1744380212225;
        Fri, 11 Apr 2025 07:03:32 -0700 (PDT)
Received: from localhost.localdomain ([2a00:6d43:105:c401:e307:1a37:2e76:ce91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f20a897b6sm51235895e9.1.2025.04.11.07.03.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 07:03:31 -0700 (PDT)
From: Marco Crivellari <marco.crivellari@suse.com>
To: marco.crivellari@suse.com
Cc: anna-maria@linutronix.de,
	chenhuacai@kernel.org,
	frederic@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	macro@orcam.me.uk,
	peterz@infradead.org,
	tglx@linutronix.de,
	tsbogend@alpha.franken.de
Subject: Re: [PATCH v7 1/2] MIPS: Fix idle VS timer enqueue
Date: Fri, 11 Apr 2025 16:03:21 +0200
Message-ID: <20250411140321.218752-1-marco.crivellari@suse.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250403161143.361461-2-marco.crivellari@suse.com>
References: <20250403161143.361461-2-marco.crivellari@suse.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Gentle Ping, also for "MIPS: rename rollback_handler 
with skipover_handler".

Thanks in advance.

