Return-Path: <linux-mips+bounces-14334-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6Ah9LXEn72lE8AAAu9opvQ
	(envelope-from <linux-mips+bounces-14334-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Mon, 27 Apr 2026 11:08:01 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F8C146F90C
	for <lists+linux-mips@lfdr.de>; Mon, 27 Apr 2026 11:08:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3ABE4305B5A9
	for <lists+linux-mips@lfdr.de>; Mon, 27 Apr 2026 09:00:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 168873ACEE3;
	Mon, 27 Apr 2026 09:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T5fgqGHt"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E6AD3AEF3D
	for <linux-mips@vger.kernel.org>; Mon, 27 Apr 2026 09:00:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777280441; cv=none; b=Z+wLN7Z23oxjAvDNZZDO4vVbNP8Em1pjzskhg7eRZHJVYkbuEfrcSdd4qKoj0fYExZoABZebWbNygtyxIeQDJP7S7+tfBk4i9CrYoy1Df0RpVkC7xTnZ8X8/aMVKoEQ/hCVEojrSQWESwoT6dl7hsipldnK8kmToWdHh9pwz554=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777280441; c=relaxed/simple;
	bh=5ITOg6EqoWqXlZntp1Gld4HRcnn+N8uuRj9oXYJFars=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L6g3H5k0Qfjw8gXL1cUjUOpiLZOz4ZFEcD/Afl8hixdoIccOOTlD3FLrW7rDr5NKvn72RydIbjmvQz9s71ggniJHI8Z/tWY0Z/2QoAfkF4efoW6ltCfqX+w6fcHn3MM5Rv0zeN6wavQR1URC8+rpVG6fS5H9SQ9L2bTsGmBaxxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T5fgqGHt; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-43d03db7f87so6795851f8f.3
        for <linux-mips@vger.kernel.org>; Mon, 27 Apr 2026 02:00:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777280437; x=1777885237; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=K7NAZlpKXzIndoIBQKSD2JPSIiZtdTLAwhYTzEj9A5o=;
        b=T5fgqGHt3Ku6xCeGPs1TZtEbjqfBjtxjNfgAHssoXLTeHWWlaAodwFbc0XLSLfZGaK
         5PbQtqN9uZeTSA8hrXx+x+mLv5hqsoh8CArc5E4c2wta+VaX4jtrw/YDyq3LhfHy+9ur
         R6mXH6At7uCt+cgsrC0VsahZwXrUxblRB1Rd3FWURbLqB/AtWNINU1TL8iZhjA8KNySr
         iymK1SB4SuGCOsB8jZWYEdD8ge7niNdn2ug3B2eBcvNugtxRAw64q6v3EswPi8qU8Bhw
         DpCKYyhrq7626ORcaVmL01vNgDiQcLkwoUMXCB1S5ilWq26S0B4MAHOmM6N3AmqMnsyR
         UsVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777280437; x=1777885237;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=K7NAZlpKXzIndoIBQKSD2JPSIiZtdTLAwhYTzEj9A5o=;
        b=MTKJVviemQxdB0/z9gax/Myw94zy0P8P7aUe/fWOV03/UdKOrwR6fBTTKfz6Xqf5H3
         evsaQrWfs/bmauanGvDgdLEFZtRfujmpdERLVmaS5NhgBfnMoDcYNihevPn+M0r/NXzl
         sVvTxTxzbO0hnhhfVDQ+MXA0KFaZs8a+XplBe7clZtkr7OefXGL1b0ZJzkcojVCnBCnH
         tnm3qh5pFKu/ZjIvI4ZENUSz7xV9W0kbfRlZlyTbd86xLSoojRzD17PC+Rs/c2Aovoc3
         nb/B9j3P2ijOObPzZWucsDdqTfA/eCP/Z+A0OWGhYJKzHfJsInyOdKNXu4NIIVWpZOfy
         u5gQ==
X-Forwarded-Encrypted: i=1; AFNElJ997XcAAsf25Iq4dLww86oSBY458qOERGepP6jWbBuMAk9AMaZx9hDrtK3NdCIRMLPzyj2T9CW1IYlf@vger.kernel.org
X-Gm-Message-State: AOJu0YyzhU6OscDbfaqfcguRJc+RCH539+vUpYOZW7qktHjvgjj1kW37
	wCKOwwyHC49kNhGmDWnJreUsHYPre/KVeVKNsZvPSXUvUOAYWI0RaMnBn5jEZw==
X-Gm-Gg: AeBDietRp8z5J9zECP1LjyRRv/NKTDQTXJqqD8Bk5jkfEBoe0CaNVuAlMxlC3kqr3/W
	GCh9KzzpkNFpiqhM8i8Kc+8oH8bECxjW+h2Sy/GLu1YPmQ9xxF77kVlIEEUZdktizdf/znUxD9v
	G/yb+FGdNk/q9Y7+rebZ4sJ3ToIG2OCNjxGNMGVP+VChmYYltx+LjGh/vPxG70EBDbW1kHxLnTz
	Dae3mwAbGnYf/c9PZKr9WirRabd3vs2wZ9zF1DhN+pQSO1ANh52iCLILc62CarGDll9xEhCYz2R
	hsEszX9iBId0wWBJb78qOEvlcLT2Y6SC/nJjk4r5vWI4I7vsrDTo7UOMiYS6n8tI3AXA3cMmOsX
	UFxU90UK3AzTqkzkkzWzhxzVW4rjPII0mNA6iZ8MF2cB5GTbnjiRm2Ae/PHDAW1hnCpIg57XU1t
	UcayvB6dmOrzZ1A1WYXgYfntkAL3SWeA==
X-Received: by 2002:a05:600c:6085:b0:488:936a:6220 with SMTP id 5b1f17b1804b1-488fb782618mr541683735e9.21.1777280436814;
        Mon, 27 Apr 2026 02:00:36 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4e4daf2sm76856446f8f.33.2026.04.27.02.00.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 02:00:36 -0700 (PDT)
Date: Mon, 27 Apr 2026 12:00:32 +0300
From: Dan Carpenter <error27@gmail.com>
To: Maxwell Doose <m32285159@gmail.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, tsbogend@alpha.franken.de,
	len.bao@gmx.us, yoelvisoliveros@gmail.com,
	linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH v4] staging: octeon: remove SPI, POW, and PKO typedef
 enums
Message-ID: <ae8lsN42HSBWZPiB@stanley.mountain>
References: <20260418230344.44242-1-m32285159@gmail.com>
 <2026042615-ambulance-upright-3041@gregkh>
 <CAKqfh0HJtz+hjJGMcDGQDQeUQDP2u5JdPh8YVwV=Q0MWhs2tTw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKqfh0HJtz+hjJGMcDGQDQeUQDP2u5JdPh8YVwV=Q0MWhs2tTw@mail.gmail.com>
X-Rspamd-Queue-Id: 1F8C146F90C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,alpha.franken.de,gmx.us,gmail.com,vger.kernel.org,lists.linux.dev];
	TAGGED_FROM(0.00)[bounces-14334-lists,linux-mips=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[error27@gmail.com,linux-mips@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-mips];
	RCPT_COUNT_SEVEN(0.00)[8];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com]

On Sun, Apr 26, 2026 at 11:46:27PM -0500, Maxwell Doose wrote:
> Hi Greg,
> 
> On Sun, Apr 26, 2026 at 10:50 PM Greg KH <gregkh@linuxfoundation.org> wrote:
> >
> > How was this tested given that the previous ones all were not?
> >
> 
> What ended up happening was when I did my test compilation, I'd
> forgotten to compile the arch/mips half of the driver. The test bot
> obviously then caught that and it ended up being fixed. It's also
> important to keep in mind that this is (or was, rather) my first
> *ever* patch, I hadn't learned all of the tools of the kernel yet. I'm
> almost certain that this revision is sound, as the test bot hasn't
> reported any errors or warnings, and Dan Carpenter hasn't asked for
> any naming changes.

I don't care about the naming so long as you don't have two enums
with the same name where one ends in _e (which stands for enum).
But I also haven't looked at this code at all.

regards,
dan carpenter


