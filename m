Return-Path: <linux-mips+bounces-6813-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DCDE39DF0A0
	for <lists+linux-mips@lfdr.de>; Sat, 30 Nov 2024 14:51:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 14B42B20F0A
	for <lists+linux-mips@lfdr.de>; Sat, 30 Nov 2024 13:51:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6688115530F;
	Sat, 30 Nov 2024 13:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CRM4Pa6b"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B993717741
	for <linux-mips@vger.kernel.org>; Sat, 30 Nov 2024 13:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732974711; cv=none; b=ks/oRYAW1JuQcl93pQkV4y3qxjeRoYvMIzmpEv4a+jHtbwDSyXrdxI5RBbCI+ej4Qjwu/mS3TOUcJEsoLzyWYzjTYyWpR3wl4wH9nEaWdoEm1xLqoWCWAMy36pmtV5T6Fl9HO1qaj2hUWxHYRcXmH2iJGTmh3jL+ss/WlxrXdEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732974711; c=relaxed/simple;
	bh=nJGKyEgPdi0L2YjlTyrwVPUPWWXHUL2Ap8gDBc6cWms=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=bNgGu47/IAlGRkWGmUlCKRxTlyBn2hIKJXDapfK9/MVCOQeoaQOGFY6PL+/sr7fS9QZvoKoNn9Q8JnebKcG9z15LArsGG0NGtUlMCRDxRkHcyH3d9AJoAB3kurKBlAzFFopFXwY5VzV0F1zwhImGAr5fY7dV+5eXuamEId2x8C0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CRM4Pa6b; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5d071f70b51so3516614a12.3
        for <linux-mips@vger.kernel.org>; Sat, 30 Nov 2024 05:51:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732974707; x=1733579507; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=nJGKyEgPdi0L2YjlTyrwVPUPWWXHUL2Ap8gDBc6cWms=;
        b=CRM4Pa6bzF3hiQTgL5gKHwWUzKr34rJyRaSF7OJlBEBXKkVPvcKQXkXho0BXUwVfR6
         oRVI2wzA71qe5BntzxBu1v6xYnTX/GZwKnQs7iHSEvqNhGRdz4dBw3BQ/7gd8xezdVAY
         1B3/Y2Nx8jNM6mbGbxRJGwqSqCH1iJTdT7KdJTWCiq5fNNWP4j77U1qwCxrndAXKetxq
         yym26AC7w6JM2oZm0hIlKkfHsz2ibFlLwPxBmV/ULKqWY8oXQwLoEZrHddo+6ooRsU05
         OcMjCJl4vUKuIwdKSOFbURiFn02ovEhhQS71iG0s5AzRbTB3YUQnMl+6BJjQymQI4644
         pcFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732974707; x=1733579507;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nJGKyEgPdi0L2YjlTyrwVPUPWWXHUL2Ap8gDBc6cWms=;
        b=s3FrRMM6T9QZrkITh4Orxb2HTfHu2Aj1HrTVPOMAuCv9l40rpsGftCMcIEZr0M3A8m
         yO5P/Nx1VL79h2XruSUTtOvGx1mZZFQGltPBi7IXx7zfVfVvC8rlm6N4r73It62accuQ
         nuaSvcyZE42zOrjvQorq910PYHIiynf2ejXBxYSjBOvVBfa3wN2soUTva5RSdxmbQXJd
         TiHQJR0BufEkmZEBqm+3cJvN17i9ZfyxIQyYOiLVgmrPqPG8iavOpLhhzzd+yvhDB8Er
         6sRoUefFDEoqCmoBHbWY6fd102hqP6bjk726iDyw2EaazjXRHyDjvxUmytIFq36z7KeQ
         BlYQ==
X-Gm-Message-State: AOJu0YwtyEjjcEt72gqhmfS+Rg+A8g3qGLAjjPGUdyx/DXtq0jXo0Uk8
	Sn+01zIBAwQZXxw3gKH9/uWHyX/wu3eIrbznAJiidPoh3mzsNUyXSRd8NsIQASdSLxWLVFURuNC
	C3saNZX8MiHxU0Y8J/+1GMZHWRDM1Cbqo
X-Gm-Gg: ASbGncvgrGljbn6mcavjJUD4BTCtEI8tHcNx294KF4jwP3Tc/ZtVfeoNsnzTWTfWP5M
	NKZuAjZWZEPh9oarRuKJgjOS4c7d6vhUXEUa9CxRvDiYj5XjM5p/ToPmbZvY+cXlt
X-Google-Smtp-Source: AGHT+IEOg9e8YRj5InmbN3ytzmKt8Gya8EE0oRhh36ZghBOkQf8tu0JnzcWPsvs2abm1kJij8rhx3rC3cOPmzKcePxI=
X-Received: by 2002:a05:6402:27ca:b0:5d0:d5ba:57a2 with SMTP id
 4fb4d7f45d1cf-5d0d5ba5e52mr183307a12.27.1732974707287; Sat, 30 Nov 2024
 05:51:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: DiTBho Down in The Bunny hole <downinthebunnyhole@gmail.com>
Date: Sat, 30 Nov 2024 14:51:37 +0100
Message-ID: <CAAZ8i81Q2WZpxqQdrVhsCBfFh7yVzD59QK0YTzQ=kcRNp1GNEQ@mail.gmail.com>
Subject: SGI IP32, O2-R10K, support status?
To: linux-mips@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

hi
The SGI O2 platform is a system known to have problems with DMA due to
its "non-cache-coherent" nature.

What state is the Linux kernel in?
Any patch? Already upstream?
Anyone working on this?

Please let me know.

